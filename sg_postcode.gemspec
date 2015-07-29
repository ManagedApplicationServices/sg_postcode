$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sg_postcode/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sg_postcode"
  s.version     = SgPostcode::VERSION
  s.authors     = ["Duy Khoa"]
  s.email       = ["duykhoa12t@gmail.com"]
  s.homepage    = "https://github.com/ManagedApplicationServices/sg_postcode"
  s.summary     = "Convert SG Postcode to long lat array"
  s.description = "Convert SG Postcode to long lat array"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.add_dependency "redis", "~> 3.2"
  s.add_dependency "rest-client", "~ 2.0"
end
