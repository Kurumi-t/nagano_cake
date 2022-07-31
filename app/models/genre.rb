class Genre < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
