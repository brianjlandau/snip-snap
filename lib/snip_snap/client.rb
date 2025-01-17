module SnipSnap
  module Client # :nodoc:

    module InstanceMethods
      
      attr_reader :url
      
      def initialize(url)
        @url = url
      end

      def image?
        true
      end
      
      def fetch
        client = Curl::Easy.new(url) do |config|
          config.follow_location = true
          config.max_redirects   = 5
          config.head            = self.class.head?
          if self.class.headers
            self.class.headers.each do |header, value|
              config.headers[header] = value
            end
          end
        end

        client.perform

        client
      end
      
      def response
        @response ||= fetch
      end

    end
    
    module ClassMethods
      
      def request_method(method_name)
        @request_method = method_name
      end
      
      def head?
        @request_method == :head
      end
      
      def set_headers(headers)
        @headers = headers
      end
      
      def headers
        @headers
      end
      
    end
    
    def self.included(other)
      other.send(:include, SnipSnap::Client::InstanceMethods)
      other.send(:extend, SnipSnap::Client::ClassMethods)
    end
    
  end
end