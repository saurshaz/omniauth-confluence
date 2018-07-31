
require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Confluence < OmniAuth::Strategies::OAuth

      option :client_options, {
        :signature_method => 'RSA-SHA1',
        :request_token_path => '/plugins/servlet/oauth/request-token',
        :authorize_path => '/plugins/servlet/oauth/authorize',
        :access_token_path => '/plugins/servlet/oauth/access-token',
        :site => nil # To be provided in the setup method or at Omniauth Builder
      }

      uid {
        # Set UID to a combination of username and base_url if the user_extra_info is not returned
        user_extra_info['result'][0]['userKey'] rescue (user_info['username'] + "@" + extra[:base_url])
      }

      info do
        {
          :username => user_info['username'],
          :name => user_info['fullName'],
          :email => user_info['email']
        }
      end

      extra do
        {
          :user_info => info,
          :base_url => consumer.options[:site],
          # :private_key => consumer.secret,
          :signature_method => consumer.options[:signature_method],
          :oauth_version => consumer.options[:oauth_version]
        }
      end

      credentials do
        {
          :token => access_token.token,
          :secret => access_token.secret,
          :session_handle => access_token.params[:oauth_session_handle],
          :expires_in => access_token.params[:oauth_expires_in],
          :authorization_expires_in => access_token.params[:oauth_authorization_expires_in]
        }
      end

      # Prototype REST Endpoints. Might change in future.
      def user_info
        @user_info ||= MultiJson.decode(access_token.get('/rest/gadget/1.0/currentUser').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      def user_extra_info
        username = user_info['username']
        @user_extra_info ||= MultiJson.decode(access_token.get("/rest/prototype/1/search/user.json?query=#{username}").body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end