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
	validates :clientname, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
	
end

class Barber < ActiveRecord::Base
end

get '/' do	
	erb :index
end

get '/visit' do
	
	erb :visit
end

post '/visit' do
	c = Client.new params[:client]
	c.save
	erb "<h2>Thank you are enlisted</h2"

end

get '/listOfBarbers' do
	@barbers = Barber.all
	erb :listOfBarbers

  end
  get '/listOfClients' do
	@clients = Client.all
	erb :listOfClients
  end

get '/contacts' do
	"Hello World"
  end

get '/support' do
	erb :support
  end