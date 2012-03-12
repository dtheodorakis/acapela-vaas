# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acapela-vaas/version"

Gem::Specification.new do |s|
  s.name        = "acapela-vaas"
  s.version     = Acapela::Vaas::VERSION
  s.authors     = ["Dimitris Theodorakis"]
  s.email       = ["dth@atrion.gr"]
  s.homepage    = ""
  s.summary     = %q{Acapela VAAS implementation for Ruby}
  s.description = %q{This Gem implements the Acapela Voice as a Service Text-to-Speech API for Ruby}

  s.rubyforge_project = "acapela-vaas"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
