require File.dirname(__FILE__) + '/../../test_helper'

module SnipSnap
  class InstagramTest < Test::Unit::TestCase
    
    context "An instance of the Instagram class" do
      setup do
        @url = 'http://instagr.am/p/PPDkS/'
      end

      should "know that it is an image" do
        y = SnipSnap::Instagram.new(@url)
        y.should be_image
      end

      should "be able to return an image url for a given url" do
        y = SnipSnap::Instagram.new(@url)
          
        y.stubs(:response).with().returns(read_fixture('instagram.json'))
        
        y.image_url.should == 'http://distillery.s3.amazonaws.com/media/2011/10/05/c82b2ffc6c3c472db8ece7c6f0531f68_7.jpg'
      end
      
    end
    
  end
end
