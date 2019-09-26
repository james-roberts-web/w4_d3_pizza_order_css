require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')

get '/' do
  @pizza_orders = PizzaOrder.all
  erb(:index)
end

# INDEX
get '/pizza-orders' do
  # get all the pizza orders
  @pizza_orders = PizzaOrder.all
  # line above will give us an array of pizza objects
  erb(:index)
end

# NEW
get '/pizza-orders/new' do
  erb(:new)
end

# CREATE
post '/pizza-orders' do
  PizzaOrder.new(params).save
  redirect'/pizza-orders'
end

# SHOW
get '/pizza-orders/:id' do
  @pizza_order = PizzaOrder.find(params[:id])
  erb(:show)
end

# EDIT
get '/pizza-orders/:id/edit' do
  @pizza_order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE
put '/pizza-orders/:id' do
  PizzaOrder.new(params).update
  redirect'/pizza-orders'
end

# DELETE
delete '/pizza-orders/:id' do
  order = PizzaOrder.find(params[:id])
  order.delete
  redirect '/pizza-orders'
end
