require 'test_helper'

class ProductsHelperTest < ActionView::TestCase

def new_product(image_url)
  Product.new(:title       => "My Book Title",
              :description => "yyy",
              :price       => 1,
              :image_url   => image_url)
end

test "image url should have a certain extension" do
  ok = ["fred.gif", "fred.jpg", "fred.png", "FRED.JPG", "FRED.Jpg",
           "http://a.b.c/x/y/z/fred.gif"]
  bad = ["fred.doc",  "fred.gif/more",  "fred.gif.more"]

  ok.each do |name|
    assert new_product(name).valid?, "#{name} shouldn't be invalid"
  end

  bad.each do |name|
    assert new_product(name).invalid?, "#{name} shouldn't be valid"
  end
end


end
