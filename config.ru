require './config/environment'


use Rack::MethodOverride
use BabiesController
use UsersController
use SchedulesController
run ApplicationController
