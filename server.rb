require "sinatra"
require "httparty"
require "./mailer.rb"


class Cake
  attr_accessor :name, :description, :price, :img
  def initialize(name,description,price, img)
    self.name = name
    self.description = description
    self.price = price
    self.img = img
  end
end
class Cookie
  attr_accessor :name, :description, :ppc, :ppd, :img
  def initialize(name,description,ppc,ppd, img)
    self.name = name
    self.description = description
    self.ppc = ppc
    self.ppd = ppd
    self.img = img
  end
end
class Muffin
  attr_accessor :name, :description, :price, :img
  def initialize(name,description,price, img)
    self.name = name
    self.description = description
    self.price = price
    self.img = img
  end
end

oreo = Cake.new("Cookies and Cream Extreme", "Layers of Devil's Food cake with creamy oreo filling inbetween, and Oreo frosting topped with oreos.", "Price: $24.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC3srPpkU9nvuBv3XV7ykhEE4j_6CIvOJOAUZrZK4pIuMx59hU")
hershey = Cake.new("Mean Hershey Machine", "Layers of pound cake with Hershey chocolate syrup inbetween, and vanilla frosting topped with Hershey Kisses.", "Price: $19.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm-urOY5wPtaSlXZj6a3mlTTfEmx1uT7DC9O9xTU_RESmMO4xZ")
cheese = Cake.new("Velvet Dreams", "Layers of red velvet cake, and cream cheese frosting topped with glazed strawberries.", "Price: $24.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNLCF_pYdfeSLVvhRVWFQdK7MEzykuf37VGziEo2fYbL6KQDd")
oatchoc = Cookie.new("Oatmeal Chocolate Chip Cookies","Oatmeal cookies with chocolate chips","Price per cookie: $1.99","Price per dozen: $19.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzGgb3eld0arWV2dLzjSjBk98ugZrE6C7tAJAHFh9bfMmOHT80")
chochip = Cookie.new("Chocolate Chip","Chocolate Chip Cookies","Price per cookie: $1.99","Price per dozen: $19.99", "http://whatsgabycooking.com/wp-content/uploads/GA9A1535.jpg")
peanut = Cookie.new("Peanut Butter Cookies","Peanut Butter Cookies","Price per cookie: $1.99","Price per dozen: $19.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzCtl5TkYKC9UWKAk6Hj-p3lquNC1zfr8v8mGHgEgBRgZGc_lk")
plain = Muffin.new("Plain Muffins","Plain muffins","Price: $2.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlj714fZZwN5JzfAaKujTmbCCrdUTWOFv1gnx_Z3otwgj8A2Il")
blue = Muffin.new("Blueberry Muffins","Blueberry muffins","Price: $2.99", "https://smittenkitchendotcom.files.wordpress.com/2010/08/perfect-blueberry-muffins.jpg?w=750")
straw = Muffin.new("Strawberry Muffins","Strawberry muffins","Price: $2.99", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_mMgXouK1mymd4lgSp2_WqRedG5AzWvgW5e_b2VcFJy2BV9xy")

def send_email(rec)
  Newsletter.welcome(rec).deliver_now #sends email to recipient
end

get "/" do
  erb :home
end

get "/cakes" do
  @cakes = [oreo, hershey, cheese]
  erb :cakes
end

get "/cookies" do
  @cookies = [oatchoc, chochip, peanut]
  erb :cookies
end

get "/muffins" do
  @muffins = [plain, blue, straw]
  erb :muffins
end

get "/thanks" do
  send_email(params[:email])
  erb :thanks
end

$api_key = 'TSRB2JJKCPVSTV5VHPF5'

get "/events" do
  @req = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=bakery&token=#{$api_key}")
  data = JSON.parse(@req.body)
  @events = data['events']
  erb :events
end
