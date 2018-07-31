# Omniauth::Confluence

[![Travis-CI](https://travis-ci.org/fnando/omniauth-confluence.svg)](https://travis-ci.org/fnando/omniauth-confluence)
[![CodeClimate](https://codeclimate.com/github/fnando/omniauth-confluence.svg)](https://codeclimate.com/github/fnando/omniauth-confluence)
[![Test Coverage](https://codeclimate.com/github/fnando/omniauth-confluence/badges/coverage.svg)](https://codeclimate.com/github/fnando/omniauth-confluence/coverage)
[![Gem](https://img.shields.io/gem/v/omniauth-confluence.svg)](https://rubygems.org/gems/omniauth-confluence)
[![Gem](https://img.shields.io/gem/dt/omniauth-confluence.svg)](https://rubygems.org/gems/omniauth-confluence)

[JIRA](https://www.atlassian.com/software/jira)'s OAuth2 Strategy for OmniAuth. This strategy uses API 2.0 to retrieve user information.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-jira'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-jira

## Usage

`OmniAuth::Strategies::Jira` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: <https://github.com/intridea/omniauth>.

First, create a new application at `https://www.atlassian.com/software/jira`. Your callback URL must be something like `https://example.com/auth/jira/callback`. For development you can use `http://127.0.0.1:3000/auth/jira/callback`.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`. This example assumes you're exporting your credentials as environment variables.

Notice that we'll always inject `account` and `emails` scopes, so we can retrieve the required information.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jira, 
            ENV['JIRA_CLIENT_ID'], 
            ENV['JIRA_CLIENT_SECRET']
end
```

Now visit `/auth/jira` to start authentication against Jira.

## Contributing

1. Fork [omniauth-atlassian-jira](https://github.com/saurshaz/omniauth-atlassian-jira/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
