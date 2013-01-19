# ParamsInquirer

ParamsInquirer gives you a prettier way to inquire params value.

## Installation

Add this line to your application's Gemfile:

    gem 'params_inquirer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install params_inquirer

## Usage

```ruby
def index
  if params[:status].accepted? # this means `params[:status] == 'accepted'`
    # ...
  elsif params[:status].rejected?
    # ...
  else
    # ...
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
