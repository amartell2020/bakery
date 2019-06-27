class Newsletter < ActionMailer::Base
  default from: "from@example.com"
  def food
    mail(to: recipient, subject: 'Here is Papito\'s Patries Catalog')
end
