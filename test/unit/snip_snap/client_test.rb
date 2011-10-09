require File.dirname(__FILE__) + '/../../test_helper'

class ClientImplementation
  include SnipSnap::Client
end

class ClientGetImplementation
  include SnipSnap::Client
  request_method :get
end

class ClientHeadersImplementation
  include SnipSnap::Client
  request_method :get
  set_headers 'Accept' => 'application/json'
end

class ClientHeadImplementation
  include SnipSnap::Client
  request_method :head
end

module SnipSnap
  class ClientTest < Test::Unit::TestCase
    
    context "An instance of the ClientImplementation class" do
      
      should "be able to fetch a response" do
        response = stub()
        
        c = ClientImplementation.new('http://example.com')
        c.expects(:fetch).once.with().returns(response)
        
        c.response.should == response
      end
      
      should "cache the response object" do
        response = stub()
        
        c = ClientImplementation.new('http://example.com')
        c.expects(:fetch).once.with().returns(response)
        
        2.times { c.response }
      end
      
      should 'return nil for headers' do
        assert_nil ClientImplementation.headers
      end
      
      should 'never set headers on the curl object' do
        url = 'http://example.com'
        
        client = mock() do |c|
          c.expects(:perform).with()
        end
        
        config = mock() do |c|
          c.expects(:follow_location=).with(true)
          c.expects(:max_redirects=).with(5)
          c.expects(:head=).with(false)
          c.expects(:headers).never
        end
        
        Curl::Easy.expects(:new).with(url).yields(config).returns(client)
        
        c = ClientImplementation.new(url)
        c.fetch.should == client
      end
      
    end
    
    context "The ClientGetImplementation class" do
      
      should "know that it doesn't make a head request" do
        ClientGetImplementation.head?.should be(false)
      end
      
    end
    
    context "An instance of the ClientGetImplementation class" do
      
      should "fetch a response using a GET request" do
        url = 'http://example.com'
        
        client = mock() do |c|
          c.expects(:perform).with()
        end
        
        config = mock() do |c|
          c.expects(:follow_location=).with(true)
          c.expects(:max_redirects=).with(5)
          c.expects(:head=).with(false)
        end
        
        Curl::Easy.expects(:new).with(url).yields(config).returns(client)
        
        c = ClientGetImplementation.new(url)
        c.fetch.should == client
      end
      
    end
    
    context "The ClientHeadersImplementation class" do
      
      should "know what it's headers are" do
        ClientHeadersImplementation.headers.should == {'Accept' => 'application/json'}
      end
      
    end
    
    context "An Instance of the ClientHeadersImplementation class" do
      
      should "know what it's headers are" do
        ClientHeadersImplementation.headers.should == {'Accept' => 'application/json'}
      end
      
    end
    
    context "The ClientHeadImplementation class" do

      should "fetch a response using and add headers" do
        url = 'http://example.com'
        
        client = mock() do |c|
          c.expects(:perform).with()
        end
        headers = mock() do |c|
          c.expects(:[]=).with('Accept', 'application/json')
        end
        
        config = mock() do |c|
          c.expects(:follow_location=).with(true)
          c.expects(:max_redirects=).with(5)
          c.expects(:head=).with(false)
          c.expects(:headers).returns(headers)
        end
        
        Curl::Easy.expects(:new).with(url).yields(config).returns(client)
        
        c = ClientHeadersImplementation.new(url)
        c.fetch.should == client
      end
      
    end
    
    context "An instance of the ClientHeadImplementation class" do
      
      should "fetch a response using a HEAD request" do
        url = 'http://example.com'
        
        client = mock() do |c|
          c.expects(:perform).with()
        end
        
        config = mock() do |c|
          c.expects(:follow_location=).with(true)
          c.expects(:max_redirects=).with(5)
          c.expects(:head=).with(true)
        end
        
        Curl::Easy.expects(:new).with(url).yields(config).returns(client)
        
        c = ClientHeadImplementation.new(url)
        c.fetch.should == client
      end
      
    end
    
    
  end
end