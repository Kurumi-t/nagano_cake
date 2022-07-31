class Address < ApplicationRecord
  belongs_to :customer

  validates :customer_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
