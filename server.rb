require "sinatra"
require "httparty"

class Cake
  attr_accessor :name, :description, :price
  def initialize(name,description,price)
    @name = name
    @description = description
    @price = price
  end
end
class Cookie
  attr_accessor :name, :description, :ppc, :ppd
  def initialize(name,description,ppc,ppd)
    @name = name
    @description = description
    @ppc = ppc
    @ppd = ppd
  end
end
class Muffin
  attr_accessor :name, :description, :price
  def initialize(name,description,price)
    @name = name
    @description = description
    @price = price
  end
end

oreo = Cake.new("Cookies and Cream Extreme", "Layers of Devil's Food cake with creamy oreo filling inbetween, and Oreo frosting topped with oreos", "Price: $24.99")
hershey = Cake.new("Mean Hershey Machine", "Layers of pound cake with Hershey chocolate syrup inbetween, and vanilla frosting topped with Hershey Kisses", "Price: $19.99")
oreo = Cake.new("Cookies and Cream Extreme", "Layers of Devil's food cake with creamy oreo filling inbetween, and Oreo frosting topped with oreos", "Price: $24.99")

get "/" do
  erb :home
end

get "/cakes" do
  erb :cakes
end

get "/cookies" do
  erb :cookies
end

get "/muffins" do
  erb :muffins
end
