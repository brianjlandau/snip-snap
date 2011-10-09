require File.dirname(__FILE__) + '/../../test_helper'

module SnipSnap
  class CloudAppTest < Test::Unit::TestCase
    
    context "An instance of the CloudApp class" do
      setup do
        @url = 'http://cl.ly/043x2D2i1F043Q3d3o3I'
      end

      should "know that it is an image if the type returned is an image" do
        c = SnipSnap::CloudApp.new(@url)
        stub_response_with_fixture(c, 'cloud_app.json')
        c.should be_image
      end
      
      should "know that it is not an image if the type returned is not an image" do
        c = SnipSnap::CloudApp.new('http://cl.ly/0Y2h0e250r0c0M1Y0F2r')
        stub_response_with_fixture(c, 'cloud_app_not_image.json')
        c.should_not be_image
      end

      should "be able to return an image url for a given url" do
        c = SnipSnap::CloudApp.new(@url)
        stub_response_with_fixture(c, 'cloud_app.json')
        c.image_url.should == 'http://f.cl.ly/items/1I3H2n0a2e0x0k2F462l/steve.png'
      end
      
    end
    
    private
    
    def stub_response_with_fixture(c, fixture_name)
      response = stub()
      response.stubs(:body_str).with().returns(read_fixture(fixture_name))
      
      c.stubs(:response).with().returns(response)
    end
    
  end
end
