# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2020-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'coverage'
require 'simplecov'
require 'simplecov-cobertura'
require 'simplecov-html'
unless Coverage.running?
  SimpleCov.command_name('features')
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::CoberturaFormatter
    ]
  )
  SimpleCov.start do
    add_filter 'features/'
    add_filter 'vendor/'
    track_files 'bin/*'
  end
end
