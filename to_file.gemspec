lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_file/version"

Gem::Specification.new do |spec|
  spec.name          = "to_file"
  spec.version       = ToFile::VERSION
  spec.authors       = ["feiyang yu"]
  spec.email         = ["yufeiyang009334@gmail.com"]

  spec.summary       = %q{"The easist way to export object to files"}
  spec.description   = %q{"This gem is aim to transform the format of objects to be suitable for exporting , and export them into specific files. "}
  spec.homepage      = "https://github.com/demaciaYu/to_file"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activesupport"
end
