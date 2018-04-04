require "sinatra"
require "sinatra/reloader"

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

get "/ex" do
	erb :ex
end

post "/" do
	@yourname = params[:yourname]
	@gender = params[:gender]
	@master = params[:master]
	@day = params[:day]
	@message = params[:message]
	@email = params[:email]

	f1 = File.open 'user.txt', 'a'
	f1.write "User #{@yourname} записался на #{@day} к #{@master}
Дополнительные пожелания: #{@message} 
E-mail для связи: #{@email}
		    ===
		    "
	f1.close


	erb :wellcome
end

get '/admin' do
	erb :admin
    
end

post '/admin' do
	@login = params[:login]
	@pass = params[:password]

	if @login == "admin" && @pass == "secret"
		send_file 'user.txt'
	else 
		@smth = 'Wrong login or password. Please, try again'
		erb :admin
	end
end

get '/contacts' do
	erb :contacts
end

get '/calc' do
	erb :calc
end

post '/calc' do
	   @need = params[:need]
	
	@long = params[:long]
	longhash = {"long1" => 1,"long2" => 2,"long3" => 3,"long4" => 4,"long5" =>5, "long6" =>6}
	stylehash = {"Cut" => 1000, "Styling" => 500, "Simplcolor" => 800, "Hardcolor" =>900}
	price = longhash[@long]*stylehash[@need]
	@messagecalc = "Вы выбрали #{price}"

	erb :calc
end
	