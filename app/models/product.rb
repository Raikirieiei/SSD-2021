class Product < ApplicationRecord
    enum status: { draft: 0, published: 1, archived: 2  }
    has_many :connect_categories
    has_many :categories, through: :connect_categories
end
