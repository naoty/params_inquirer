require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/string_inquirer'

module ParamsInquirer
  class Parameters < ActiveSupport::HashWithIndifferentAccess
    def []=(key, value)
      super(key, convert_to_inquirer(value))
    end

    protected

    def convert_to_inquirer(value)
      s_value = value.is_a?(Symbol) ? value.to_s : value
      ActiveSupport::StringInquirer.new(s_value)
    end
  end
end
