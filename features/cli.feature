Feature: Command Line Processing
  As a author of LaTeX document I want to check spelling

  Scenario: Help can be printed
    When I run bin/texqc with "--help"
    Then Exit code is zero
    And Stdout contains "--help"

  Scenario: Good LaTeX log output can be checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear friend?
    \end{document}
    """
    When I run bash with "pdflatex article.tex"
    Then I run bin/texqc with ""
    Then Exit code is zero
    And Stdout contains "No LaTeX processing errors found"

  Scenario: Bad LaTeX log output checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    HowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyouHowareyou
    \end{document}
    """
    When I run bash with "pdflatex article.tex"
    Then I run bin/texqc with "article"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"

  Scenario: Bad LaTeX log output checked with LaTeX warning
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    test\label{xxx}test\label{xxx}
    \end{document}
    """
    When I run bash with "pdflatex article.tex"
    Then I run bin/texqc with "article.tex"
    Then Exit code is not zero
    And Stdout contains "1 LaTeX processing errors"

  Scenario: Bad LaTeX log output checked with LaTeX warning, but ignored
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    test\label{xxx}test\label{xxx}
    \end{document}
    """
    When I run bash with "pdflatex article.tex"
    Then I run bin/texqc with "--ignore 'may have changed' article.tex"
    Then Exit code is zero

  Scenario: Bad LaTeX log output checked with LaTeX warning, but ignored with .texqc
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    test\label{xxx}test\label{xxx}
    \end{document}
    """
    And I have a ".texqc" file with content:
    """
    --verbose

    --ignore='may have changed'
    """
    When I run bash with "pdflatex article.tex"
    Then I run bin/texqc
    Then Exit code is zero
