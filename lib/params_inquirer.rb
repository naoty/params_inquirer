if defined?(Rails)
  require 'params_inquirer/railtie'
else
  # if not using Rails, require parameters directly
  require 'params_inquirer/parameters'
end
