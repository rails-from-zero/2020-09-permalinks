module Permalinkable
  extend ActiveSupport::Concern

  included do
    cattr_accessor :permalink_column, default: "title"
    cattr_accessor :permalink_scope
    attr_accessor :regenerate_permalink
    before_save :set_permalink
  end

  def generate_permalink(count = 0)
    column_value = attributes.fetch(self.class.permalink_column)
    new_permalink = PermalinkNormalizer.new(column_value).normalize

    if count > 0
      new_permalink += "-#{count}"
    end

    if scoped_permalink_entries.find_by(permalink: new_permalink)
      new_permalink = generate_permalink(count + 1)
    end

    new_permalink
  end

  def to_param
    permalink
  end

  private

  def scoped_permalink_entries
    context = attributes.slice(self.class.permalink_scope)
    self.class.where(context).where.not(id: id)
  end

  def set_permalink
    if regenerate_permalink.to_i > 0 || (new_record? && !permalink?)
      self.permalink = generate_permalink
    end
  end
end
