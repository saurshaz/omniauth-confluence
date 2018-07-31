require "test_helper"

class ClientOptionsTest < Minitest::Test
  let(:app) { ->(env) { } }

  let(:strategy) do
    OmniAuth::Strategies::Confluence.new(app, "consumer_id", "consumer_secret")
  end

  test "sets name" do
    assert_equal "confluence", strategy.options.name
  end

  test "sets site" do # chang the hardcoding belo
    assert_equal ENV['CONFLUENCE_SITE'], strategy.options.client_options.site
  end

  test "sets authorize url" do
    assert_equal "/site/oauth2/authorize", strategy.options.client_options.authorize_url
  end

  test "sets token url" do
    assert_equal "/site/oauth2/access_token", strategy.options.client_options.token_url
  end
end
