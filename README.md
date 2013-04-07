# Wix Ruby Bindings

Rubygem to interact with Wix's add-on marketplace API.

## Installation

Add this line to your application's Gemfile:

    gem 'wix'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wix

Then in your application initialize the gem:

    $ Wix.app_secret_key  = "your_app_secret_key"
    $ Wix.app_key         = "your_app_key"


## Usage

### Parse Instance

    $ Wix::Instance.parse("instance_parameter_from_wix")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
