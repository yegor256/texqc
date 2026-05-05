# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2020-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'English'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to?(:required_rubygems_version=)
  s.required_ruby_version = '>= 3.3'
  s.name = 'texqc'
  s.version = '0.9.0'
  s.license = 'MIT'
  s.summary = 'Quality Control of Your LaTeX Build'
  s.description = 'Run it after you compile your LaTeX document'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor256@gmail.com'
  s.homepage = 'https://github.com/yegor256/texqc'
  s.files = `git ls-files | grep -v -E '^(test/|\\.|renovate)'`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  s.add_dependency('backtrace', '~> 0.4')
  s.add_dependency('loog', '~> 0.8')
  s.add_dependency('slop', '~> 4.10')
  s.add_development_dependency('cucumber', '~> 11.0')
  s.add_development_dependency('rake', '~> 13.4')
  s.add_development_dependency('rubocop', '~> 1.86')
  s.add_development_dependency('rubocop-rspec', '~> 3.9')
  s.metadata['rubygems_mfa_required'] = 'true'
end
