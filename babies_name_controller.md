class BabiesNameController < ApplicationController

  post '/names/:id' do
    @baby = Baby.find(params[:id])
      erb :'/babies/edit_baby'
      binding.pry
  end

  post '/names/:name/edit' do
    @baby = Baby.new(name: params["name"], age: params["age"], user_id: current_user.id)
      erb :'/babies/edit_baby'
      # binding.pry
      # else
      #   redirect to('/login')
      # end
  end

  patch '/names/:name' do
    @babies = Baby.all
    @baby = Baby.new(params[:name], params[:age])
    erb :'/babies/edit_baby'
 
  end  
end
