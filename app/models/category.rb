class Category < ApplicationRecord
    has_many :connect_categories
    has_many :products, through: :connect_categories
end
