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