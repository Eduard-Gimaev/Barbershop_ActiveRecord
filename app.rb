#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/activerecord'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "barbershop.sqlite3"}

class YourApplication < Sinatra::Base
	register Sinatra::ActiveRecordExtension
end

class Client < ActiveRecord::Base
	validates :clientname, presence: true, length: {minimum: 3}
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
	
end

before do 
	@barbers = Barber.all
	@clients = Client.all
end

class Barber < ActiveRecord::Base
end

get '/' do	
	erb :index
end

get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do
	@c = Client.new params[:client]
	if @c.save
	erb "<h2>Thank you are enlisted</h2"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end

end

get '/listOfBarbers' do
	
	erb :listOfBarbers

  end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end

  get '/listOfClients' do
	erb :listOfClients
  end

  get '/client/:id' do
	@client = Client.find(params[:id])
	erb :client
end

get '/contacts' do
	"Hello World"
  end

get '/support' do
	erb :support
  end