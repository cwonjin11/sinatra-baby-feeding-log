class UsersController < ApplicationController


  get '/signup' do
    if !session[:user_id]
        erb :'users/create_user'
    else
      redirect to('/log')
    end
  end

  post '/signup' do
    @user = User.new(params)
        if !@user.save
                erb :error
        else 
            session[:user_id] = @user.id
            redirect to('/log')
        end
    end
end

