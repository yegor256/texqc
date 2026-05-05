# SPDX-FileCopyrightText: Copyright (c) 2020-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT
Feature: Command Line Processing
  As an author of LaTeX document I want to check spelling

  Scenario: Help can be printed
    When I run bin/texqc with "--help"
    Then Exit code is zero
    And Stdout contains "--help"

  Scenario: A clean log produces no errors
    Given I have a "article.log" file with content:
    """
    This is pdfTeX, output written on article.pdf (1 page, 1234 bytes).
    """
    Then I run bin/texqc with "article"
    Then Exit code is zero
    And Stdout contains "No LaTeX processing errors found"

  Scenario: An overfull box is reported
    Given I have a "article.log" file with content:
    """
    Overfull \hbox (50.12345pt too wide) in paragraph at lines 3--3
    """
    Then I run bin/texqc with "article"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"

  Scenario: A LaTeX warning is reported
    Given I have a "article.log" file with content:
    """
    LaTeX Warning: Label `xxx' multiply defined.
    """
    Then I run bin/texqc with "article"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"

  Scenario: A LaTeX warning can be ignored from the command line
    Given I have a "article.log" file with content:
    """
    LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.
    """
    Then I run bin/texqc with "--ignore 'may have changed' article"
    Then Exit code is zero

  Scenario: Class warning with a hyphen in the class name is not ignored
    Given I have a "book.log" file with content:
    """
    Class yb-book Warning: page 78 is too long.
    """
    Then I run bin/texqc with "book"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"

  Scenario: Package warning with a hyphen in the package name is not ignored
    Given I have a "book.log" file with content:
    """
    Package etex-pkg Warning: redefining \foo.
    """
    Then I run bin/texqc with "book"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"

  Scenario: Ignore patterns from .texqc are honored
    Given I have a "article.log" file with content:
    """
    LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.
    """
    And I have a ".texqc" file with content:
    """
    --verbose
    --ignore=changed
    """
    Then I run bin/texqc with "article"
    Then Exit code is zero

  Scenario: A log with invalid UTF-8 bytes is processed without crashing
    Given I have a "article.log" file with content:
    """
    Some unrelated line with a bad byte: \xFF here
    LaTeX Warning: Label `xxx' multiply defined.
    """
    Then I run bin/texqc with "article"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"
