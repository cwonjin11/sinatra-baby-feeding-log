class BabiesController < ApplicationController
    get '/logs' do
            erb :'babies/index'
    end
end