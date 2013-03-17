require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/string_inquirer'

module ParamsInquirer
  # Public: Wrapped parameter which gives an easier way to inquire values.
  #
  # Examples
  #
  #   params = ParamsInquirer::Parameters.new
  #   params[:name] = "naoty"
  #   params[:name].naoty?  #=> true
  #   params[:name].anyone? #=> false
  class Parameters < ActiveSupport::HashWithIndifferentAccess
    # Public: Initialize a parameter.
    #
    # other_hash - A hash object which will be wrapped.
    #
    # Returns a Parameters.
    def initialize(other_hash = {})
      params = super()
      other_hash.each_pair do |key, value|
        params[key] = convert_value(value)
      end
      params
    end

    # Public: Set a converted value into a key.
    #
    # Returns nothing.
    def []=(key, value)
      super(key, convert_value(value))
    end

    protected

    # Internal: Convert a given value into a StringInquirer.
    #
    # value - a value which will be converted.
    #
    # Examples
    #
    #   name = convert_value("naoty")
    #   name.naoty? #=> true
    #
    #   name = convert_value(:naoty)
    #   name.naoty? #=> true
    #
    #   params = convert_value({ name: "naoty" })
    #   params[:name].naoty? #=> true
    #
    # Returns a StringInquirer if the value is a String or a Symbol.
    # Returns a Parameters if the value is a Hash.
    # Returns the value itself if the value is anything else.
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
