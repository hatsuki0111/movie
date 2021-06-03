class Movie < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :year, presence: true
    validates :description, presence: true, length: { maximum: 140 }
    validates :image_url, presence: true

    has_many :schedules

  def self.search(search, is_showing)
    if search.present? && is_showing.present?
         Movie.where(['name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"]).where(is_showing: "#{is_showing}")
    elsif search.present?
         Movie.where(['name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"])
    elsif is_showing.present?
         Movie.where(is_showing: "#{is_showing}")
    else
         Movie.all
    end
  end

end
