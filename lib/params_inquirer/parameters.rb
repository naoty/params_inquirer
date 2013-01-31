require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/string_inquirer'

module ParamsInquirer
  class Parameters < ActiveSupport::HashWithIndifferentAccess
    def initialize(other_hash = {})
      params = super()
      other_hash.each_pair do |key, value|
        params[key] = convert_value(value)
      end
      params
    end

    def []=(key, value)
      super(key, convert_value(value))
    end

    protected

    def convert_value(value)
      case value
      when String
        ActiveSupport::StringInquirer.new(value)
      when Symbol
        ActiveSupport::StringInquirer.new(value.to_s)
      when Hash
        Parameters.new(value)
      else
        value
      end
    end
  end
end
