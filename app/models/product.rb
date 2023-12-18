class Product < ApplicationRecord
    belongs_to :merchant
    has_one_attached :image
end
