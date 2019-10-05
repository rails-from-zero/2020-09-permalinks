class Category < ApplicationRecord
  include Permalinkable

  self.permalink_column = "name"
end
