Rails.application.routes.draw do

  namespace :api do
    get "/products" => "products#all_products_action"
  end

end
