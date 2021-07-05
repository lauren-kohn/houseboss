require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
# will allow use of PATCH and DELETE functionality

use ItemsController
use UsersController
run ApplicationController
