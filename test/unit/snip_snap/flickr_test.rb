require File.dirname(__FILE__) + '/../../test_helper'

module SnipSnap
  class FlickrTest < Test::Unit::TestCase
    
    context "An instance of the Flickr class" do
      setup do
        @url          = 'http://flic.kr/p/64cBqN'
        @expanded_url = 'http://www.flickr.com/photos/northernraven/3317998738/'
      end
      
      should "know that it is an image" do
        f = SnipSnap::Flickr.new(@url)
        f.should be_image
      end
      
      should "know the endpoint URL" do
        response = stub()
        response.stubs(:last_effective_url).with().returns(@expanded_url)

        f = SnipSnap::Flickr.new(@url)
        f.stubs(:response).with().returns(response)

        f.endpoint_url.should == @expanded_url
      end
      
      should "know the image url" do
        
        f = SnipSnap::Flickr.new(@url)
        f.oembed_client.stubs(:response).returns(read_fixture('flickr.json'))
        
        f.image_url.should == 'http://farm4.static.flickr.com/3489/3317998738_e894954236.jpg'
      end
      
    end
    
  end
end
