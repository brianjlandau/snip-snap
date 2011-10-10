module SnipSnap
  class Flickr
    class Oembed < OembedClient
      base_url 'http://flickr.com/services/oembed'
      default_options :maxwidth => '520'
    end

    include Client

    request_method :head
    
    def endpoint_url
      response.last_effective_url
    end
    
    def image_url
      oembed_client.embed_url
    end
    
    def oembed_client
      @client ||= if url =~ /flic\.kr/
        Oembed.new(endpoint_url)
      else
        Oembed.new(@url)
      end
    end
    
  end
end