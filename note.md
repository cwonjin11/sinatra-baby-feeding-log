class User < ActiveRecord::Base
    has_many :babies
    # validates :username, :email, presence: true
  
    has_secure_password
  
  end
  



baby index 

  <% if @babies.size > 0 %>
    <% @babies.each do |baby| %>
      <% if baby.user_id == @current_user.id %>
        <li><a href="/babies/<%= baby.id %>"><b><%= baby.name %></b></a></li>
        <br></br>
      <% end %>
    <% end %>
    <a href="/babies/new">Create a new one here</a>
  <% else %>
    <p>You don't have any babies! <a href="/babies/new">Create a new one here</a>.</p>
  <% end %>
</ul>



babies_controller
 get '/babies/new' do
        if logged_in?
          @current_user
          erb :'babies/new'
        else
          redirect to('/login')
        end
      end


user_controller
      get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
          # @user = current_user
          # @user = nil
          # session.destroy
          # redirect '/'
        else
          redirect '/'
        end

      end

    post '/babies' do
       
        if logged_in?
          @baby = current_user.babies.build(params)
 
          if !@baby.save
            @errors = @baby.errors.full_messages
            erb :'/babies/new'
            
          else
            redirect to('/babies')
          end
        else
          redirect to('/login')
        end
    end  



      <label for="feeding_type">Feeding Type: </label>
  <input type="string" name="feeding_type" id="feeding_type" value="<%= @scheme.feeding_type %>"/>


<% @schedules.each do |scheme| %>
  <% if scheme.baby_id == baby.id %>
    <% end %>
  <% end %>
  


<% @schedules.each do |scheme| %>
  <% if scheme.baby_id == @baby.id %>


      <div>
    <label for="feeding_type">Feeding type</label>
    <input type="string" name="feeding_type" id="feeding_type" value="<%= @scheme.feeding_type %>"><br>
    </div>

        # binding.pry
    # @baby = Baby.find(params[:id])
    # @scheme = Schedule.find_by([baby_id: @baby.id])
    
    # binding.pry



        get '/schedules/:id' do 
       
        @scheme = Schedule.find(params[:id])
       
          erb :'schedules/new'
          if logged_in? && @baby.user_id == current_user.id
        else
          redirect to('/login')
        end
      end  



       <div>
    <label for="name">Name</label>
    <input type="string" name="name" id="name" value="<%= @baby.name %>"><br>
    <label for="age">Age</label>
    <input type="number" name="age" id="age" min="0" step="0" max="5"value="<%= @baby.age %>"><br>
    </div>




     post '/babies/:name' do
    @baby = Baby.find(params[:name])
      erb :'/babies/edit_baby'
      # binding.pry
  end

  post '/babies/:name/edit' do
    @baby = Baby.new(name: params["name"], age: params["age"], user_id: current_user.id)
      erb :'/babies/edit_baby'
      # binding.pry
      # else
      #   redirect to('/login')
      # end
  end

  patch '/babies/:name' do
    @babies = Baby.all
    @baby = Baby.new(params[:name], params[:age])
    erb :'/babies/edit_baby'
 
  end  



<form action="/babies/<%= @baby.id %>/edit" >
  <input type="hidden" id="hidden" name="_method" value="edit"/>
  <input type="submit" value="Edit Baby">
</form>


<% else %>
<p>No logs for this baby. <a href="/babies/<%= @baby.id %>/edit">Add Baby Logs </a>.</p>
<% end %>
\

<form action="/schedules/<%= @scheme.id %>" >


==================================================

schedules_controller original version before git push

class SchedulesController < ApplicationController

    # get '/schedules/' do
    #     if logged_in? 
    #         @user = User.find(session[:user_id])
    #         @babies = Baby.all
    #         # @baby = Baby.find(params[:id])
    #         erb :'schedules/index'
    #     end
    # end

    get '/schedules/:id' do
    #    binding.pry
        # @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
        # end_time: params["end_time"], total_amount: params["total_amount"], baby_id: params["baby_id"], user_id: params["user_id"] )
        # @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
        #     end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
        @scheme = Schedule.find(params[:id])
        # @scheme = Schedule.new(params)
        # @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
        #     end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
        # @baby = Baby.find(params[:id])
        # @babies = Baby.all
    #   binding.pry
       
        if logged_in? 
            @babies = Baby.all
            @schedules = Schedule.all
            @scheme = Schedule.find(params[:id])
            @baby = Baby.find(@scheme.baby_id)
             @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
                end_time: params["end_time"], total_amount: params["total_amount"], baby_id: params["baby_id"], user_id: params["user_id"] )
                # binding.pry
            erb :'schedules/show'            

        else
            redirect to('/login')
        end
    end

    get '/babies/:id/schedules/new' do

        # binding.pry
        # # @scheme = Schedule.find(params[:id])
        # @scheme = Schedule.find(params[:id])
        @baby = Baby.find(params[:id])
        # @baby = Baby.find(@scheme.baby_id)
        # # binding.pry
        if logged_in? 
            # @user = User.find(session[:user_id])
            # @baby = Baby.find(@scheme.baby_id)
            # @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
            #     end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id )
            # @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
            #     end_time: params["end_time"], total_amount: params["total_amount"], baby_id: params["baby_id"], user_id: params["user_id"])
        erb :'schedules/new'

        end
    end

    post '/babies/:id/schedules' do
        # binding.pry
        if logged_in?
            @baby = Baby.find(params[:id])
            @scheme = Schedule.new(feeding_type: params["feeding_type"], start_time: params["start_time"], 
                    end_time: params["end_time"], total_amount: params["total_amount"], baby_id: @baby.id, user_id: current_user.id)
            #   @errors = @baby.errors.full_messages
            #   erb :'/babies/new'
            @scheme.save
            
              redirect to "/babies/#{@baby.id}" 

        else
            redirect to('/login')
        end
    end
    
    # get '/schedules/' do
    #     # binding.pry
    #     if logged_in? 
    #         @current_user = User.find(session[:user_id])
    #         @schedules = Schedule.all
    #         @babies = Baby.all

    #         erb :'schedules/show_schedules'
    #       else
    #         redirect '/login'
    #       end
    # end

    patch '/babies/:baby_id/schedules/:id' do
        # binding.pry
        @scheme = Schedule.find(params[:id])
        @baby = Baby.find(@scheme.baby_id)
        @scheme.feeding_type = params[:feeding_type]
        @scheme.start_time = params[:start_time]
        @scheme.end_time = params[:end_time]
        @scheme.total_amount = params[:total_amount]
        # binding.pry
        if !@scheme.save
          @errors = @scheme.errors.full_messages
          erb :'/schedules/update'
        else
          redirect to("/babies/#{@baby.id}")
        end
    end  
     



    get '/babies/:baby_id/schedules/:id/update' do
    
        # binding.pry
    
    # if logged_in? && @baby.user_id == current_user.id
        if logged_in? 
            @user = User.find(session[:user_id])
            @scheme = Schedule.find(params[:id])
            @baby = Baby.find(params[:baby_id])
        
        erb :'/schedules/update'
        else
        redirect to('/login')
        end
    end







    delete '/babies/:baby_id/schedules/:id/delete' do
        # binding.pry
        @scheme = Schedule.find(params[:id])
        if logged_in?
            @scheme.destroy
            @baby = Baby.find(@scheme.baby_id)
            redirect to("/babies/#{@baby.id}")
        else
            redirect to('/login')

        end
    end

  



end

==================================================