require 'test_helper'
require 'rack/test'

class EventTest < ActionDispatch::IntegrationTest
  include Rack::Test::Methods
  setup do
    @host = hosts(:one)
    @org = orgs(:one)
  end

    test "should get events_for_org" do
      get 'events/events_for_org.json', id: @org.id.to_s
      assert last_response.ok?
      # assert_not_nil assigns(:events)
      assert(JSON.parse(last_response.body)['org'], "org1")
    end

    test "should get events_for_server" do
      get 'events/events_for_host.json', host_name: @host.name, count: 5
      assert last_response.ok?
      byebug
      assert(JSON.parse(last_response.body)['host_name'], @host.name)
    end
end