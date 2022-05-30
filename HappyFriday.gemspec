# frozen_string_literal: true

require_relative "lib/HappyFriday/version"

Gem::Specification.new do |spec|
  spec.name = "HappyFriday"
  spec.version = HappyFriday::VERSION
  spec.authors = ["holasoynaoki"]
  spec.email = ["naoki13futsal@gmail.com"]

  spec.summary = "Determine if today is a HappyFriday."
  spec.description = "Determine if today is a HappyFriday."
  spec.homepage = "https://github.com/holasoynaoki/HappyFriday"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/holasoynaoki/HappyFriday"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
