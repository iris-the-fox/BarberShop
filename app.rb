require "sinatra"

get "/" do
	erb :home
end

get "/about" do
	"this app is our second Sinatra App!"
end

get "/roll-die" do
	"Your die roll is... #{rand(1..6)}"
end


get "/Sinatra" do
	"<h3> I love  <a href='http://www.sinatrarb.com/'> Sinatra! </a> </h3>"
end

post "/" do
	erb :wellcome
end
