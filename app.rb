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
	@yourname = params[:yourname]
	@gender = params[:gender]
	@master = params[:master]
	@day = params[:day]
	@message = params[:message]
	@email = params[:email]

	f = File.open 'user.txt', 'a'
	f.write "User #{@yourname} записался на #{@day} к #{@master}
		    Дополнительные пожелания: #{@message} 
		    E-mail для связи: #{@email}
		    ==="
	f.close


	erb :wellcome
end

	