require 'active_support/lazy_load_hooks'
require 'params_inquirer/action_controller/base'

module ParamsInquirer
  class Railtie < ::Rails::Railtie
    initializer 'initialize params_inquirer' do
      ActiveSupport.on_load(:action_controller) do
        ::ActionController::Base.send :include, ParamsInquirer::ActionController::Base
      end
    end
  end
end
