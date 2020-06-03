class Product < ApplicationRecord

  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
    result = price.to_f * 0.09
    result.round(2)
  end

  def total
    result = price.to_f + tax
    result
  end

end
