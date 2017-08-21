require_relative "config/application.rb"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end




get '/' do
@restaurants = Restaurant.all

erb :index
end

post '/restaurants' do

restaurant = Restaurant.new(name:params[:name],description:params[:description])
restaurant.save

redirect to '/'
end




get '/restaurants/new' do


erb :new
end



get '/restaurants/:id' do
@restaurant = Restaurant.find(params[:id])


erb :restaurant
end







get '/about' do

"About"
end







