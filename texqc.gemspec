# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2020-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'English'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new('>= 0')
  end
  s.rubygems_version = '2.2'
  s.required_ruby_version = '>= 2.3'
  s.name = 'texqc'
  s.version = '0.0.0'
  s.license = 'MIT'
  s.summary = 'Quality Control of Your LaTeX Build'
  s.description = 'Run it after you compile your LaTeX document'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor256@gmail.com'
  s.homepage = 'http://github.com/yegor256/texqc'
  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  s.add_runtime_dependency 'backtrace', '~> 0.3'
  s.add_runtime_dependency 'loog', '~> 0.2'
  s.add_runtime_dependency 'slop', '~> 4.8.2'
  s.add_development_dependency 'codecov', '0.2.6'
  s.add_development_dependency 'cucumber', '~> 1.3.17'
  s.add_development_dependency 'rake', '12.3.3'
  s.add_development_dependency 'rubocop', '0.61.0'
  s.add_development_dependency 'rubocop-rspec', '1.31.0'
end
