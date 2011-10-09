module SnipSnap
  class Skitch

    include Client
    
    request_method :get
    
    def image_url
      body = Hpricot(response.body_str)
      body.search('img#skitch-image').first.attributes['src']
    end
    
  end
end