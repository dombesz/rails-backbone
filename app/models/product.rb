class Product < ActiveRecord::Base
  attr_accessible :count, :name, :price, :image_url
end
