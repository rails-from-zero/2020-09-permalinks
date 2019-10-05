class Article < ApplicationRecord
  include Permalinkable

  self.permalink_scope = "category_id"

  belongs_to :category

  validates :title, :content, :category, presence: true
end
