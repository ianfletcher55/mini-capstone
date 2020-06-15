class Product < ApplicationRecord

  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :product_categories
  has_many :categories, through: :product_categories

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

  def category_names
    categories.map { |category| category.name }
  end

end
