module SnipSnap
  class CloudApp
    
    include Client

    request_method :get
    
    set_headers 'Accept' => 'application/json'
    
    def image?
      json['item_type'] == 'image'
    end
    
    def image_url
      json['remote_url']
    end

    def json
      @json ||= MultiJson.decode(response.body_str)
    end
    
  end
end