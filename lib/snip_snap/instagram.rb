module SnipSnap
  class Instagram
    
    include Client

    request_method :get
    
    def url
      "http://api.instagram.com/oembed?url=#{@url}"
    end
    
    def image_url
      body = response.body_str
      MultiJson.decode(body)['url']
    end
    
  end
end