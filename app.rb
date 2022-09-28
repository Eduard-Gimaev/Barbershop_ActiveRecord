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

class Clients < ActiveRecord::Base
end

class Barbers < ActiveRecord::Base
end

get '/' do
	@barbers = Barbers.all
	erb :index
end