class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index' 
  end

  get '/owners/new' do 
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do 
    # binding.pry
    @owner = Owner.create(name: params[:owner][:name], pet_ids: params[:owner][:pet][:id])
  end

  get '/owners/:id/edit' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do 
    # binding.pry
    @owner = Owner.find(params[:id])
    @owner.update(params[:owner])
    redirect "owner/#{@owner.id}"
   
  end
end