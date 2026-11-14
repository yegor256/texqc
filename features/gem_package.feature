# SPDX-FileCopyrightText: Copyright (c) 2020-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT
Feature: Gem Package
  As a source code writer I want to be able to
  package the Gem into .gem file

  Scenario: Gem can be packaged
    When I run Ruby with:
    """
    require 'rubygems/package'
    Dir.chdir('texqc') do
      gem = Gem::Package.build(Gem::Specification.load('texqc.gemspec'))
      spec = Gem::Package.new(gem).spec
      raise 'missing texqc executable' unless spec.executables.include?('texqc')
      raise 'missing bin/texqc' unless spec.files.include?('bin/texqc')
    end
    """
    Then Exit code is zero
