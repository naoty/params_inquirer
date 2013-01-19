require 'params_inquirer/action_controller/base'

module ParamsInquirer
  class Railtie < ::Rails::Railtie
    initializer 'initialize params_inquirer' do
      ::ActionController::Base.send :include, ParamsInquirer::ActionController::Base
    end
  end
end
