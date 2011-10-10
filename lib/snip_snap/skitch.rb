module SnipSnap
  class Skitch < OembedClient
    base_url 'http://skitch.com/oembed'
    default_options :maxwidth => '520'
    
    def image?
      true
    end
    
    def image_url
      embed_url
    end
    
  end
end