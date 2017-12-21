# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jaunt_journal_theme"
  spec.version       = "0.0.1"
  spec.authors       = ["Ben McIntyre"]
  spec.email         = ["ben@bmcintyre.co.uk"]

  spec.summary       = %q{A Jekyll theme for the "jauntjournal.co.uk".}
  spec.homepage      = "https://github.com/Confusedfish/confusedfish.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

#  spec.add_development_dependency "jekyll", "~> 3.4"

  spec.add_development_dependency "public_suffix", "= 2.0.5"
  spec.add_development_dependency "github-pages", "~> 172"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "wdm", "~> 0.1.0" if Gem.win_platform?
end
