class PermalinkNormalizer
  attr_accessor :text, :max_length

  def initialize(text, max_length: 50)
    self.text = text
    self.max_length = max_length
  end

  def normalize
    text
      .gsub(/((?!\p{Alnum}|\p{So}).)+/, "-")
      .delete_prefix("-")
      .delete_suffix("-")
      .downcase[0..max_length - 1]
  end
end
