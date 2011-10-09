require File.dirname(__FILE__) + '/../../test_helper'

module SnipSnap
  class SkitchTest < Test::Unit::TestCase

    context "An instance of the Skitch class" do
      setup { @url = 'http://skitch.com/example' }
      
      should "know that it is an image" do
        s = SnipSnap::Skitch.new(@url)
        s.should be_image
      end
      
      should "have a URL" do
        s = SnipSnap::Skitch.new(@url)
        s.url.should == @url
      end
      
      should "be able to return an image url for a given url" do
        s = SnipSnap::Skitch.new(@url)
        
        response = stub()
        response.stubs(:body_str).with().returns(read_fixture('skitch.html'))
        
        s.stubs(:response).with().returns(response)
        
        s.image_url.should == 'http://img.skitch.com/20080924-c2caytj6qcq621h1shfqsxyue3.jpg'
      end
      
    end
    
  end
end