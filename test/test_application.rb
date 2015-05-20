require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_response_body
    get '/'

    body = last_response.body
    assert body['Hello']
  end

  def test_response_status
    get '/'

    assert last_response.ok?
  end
end
