class Product < ApplicationRecord
    has_many :connect_categories
    has_many :categories, through: :connect_categories
end
