Rails.application.routes.draw do

  namespace :api do
    get "/products" => "products#all_products_action"

    get "/guitar_strings" => "products#get_guitar_strings"

    get "/guitar_case" => "products#get_guitar_case"

    get "/jazzmaster_guitar" => "products#get_jazzmaster_guitar"

  end

end
