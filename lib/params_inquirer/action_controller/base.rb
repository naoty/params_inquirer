require 'active_support/core_ext/module/attr_internal'
require 'params_inquirer'

module ParamsInquirer
  module ActionController::Base
    attr_internal :params

    def params
      @_params ||= ParamsInquirer::Parameters.new(super)
    end
  end
end
