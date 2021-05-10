class Movie < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :year, presence: true
    validates :description, presence: true, length: { maximum: 140 }
    validates :image_url, presence: true
end
