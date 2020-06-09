class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images

  validates :name, uniqueness: true, length: { in: 1...100 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 10...500 }


  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end