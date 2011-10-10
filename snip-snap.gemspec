# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{snip-snap}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2011-10-09}
  s.email = %q{reaganpr@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/snip_snap", "lib/snip_snap/client.rb", "lib/snip_snap/cloud_app.rb", "lib/snip_snap/flickr.rb", "lib/snip_snap/image.rb", "lib/snip_snap/imgly.rb", "lib/snip_snap/instagram.rb", "lib/snip_snap/skitch.rb", "lib/snip_snap/twitgoo.rb", "lib/snip_snap/twitpic.rb", "lib/snip_snap/version.rb", "lib/snip_snap/yfrog.rb", "lib/snip_snap.rb", "test/fixtures", "test/fixtures/cloud_app.json", "test/fixtures/cloud_app_not_image.json", "test/fixtures/flickr.json", "test/fixtures/instagram.json", "test/fixtures/skitch.json", "test/fixtures/twitgoo.xml", "test/fixtures/yfrog.xml", "test/integration", "test/integration/response_test.rb", "test/test_helper.rb", "test/unit", "test/unit/snip_snap", "test/unit/snip_snap/client_test.rb", "test/unit/snip_snap/cloud_app_test.rb", "test/unit/snip_snap/flickr_test.rb", "test/unit/snip_snap/image_test.rb", "test/unit/snip_snap/imgly_test.rb", "test/unit/snip_snap/instagram_test.rb", "test/unit/snip_snap/skitch_test.rb", "test/unit/snip_snap/twitgoo_test.rb", "test/unit/snip_snap/twitpic_test.rb", "test/unit/snip_snap/yfrog_test.rb", "test/unit/snip_snap_test.rb"]
  s.homepage = %q{http://sneaq.net}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A ruby library that allows you to extract images from popular image-sharing services}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<curb>, [">= 0.5.1.0"])
      s.add_runtime_dependency(%q<hpricot>, ["~> 0.8.4"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<oembed_client>, [">= 0"])
    else
      s.add_dependency(%q<curb>, [">= 0.5.1.0"])
      s.add_dependency(%q<hpricot>, ["~> 0.8.4"])
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<oembed_client>, [">= 0"])
    end
  else
    s.add_dependency(%q<curb>, [">= 0.5.1.0"])
    s.add_dependency(%q<hpricot>, ["~> 0.8.4"])
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<oembed_client>, [">= 0"])
  end
end
