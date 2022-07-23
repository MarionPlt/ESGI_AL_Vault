Feature: Movie

@create-movie-with-valid-data
Scenario: Create movie with valid data
    Given the label "Dune"
    And the release date "06/02/1985"
    And the support "physical"
    And the imageUrl "localhost://images/dune"
    And the director "David Lynch"
    And the editor "Universal Pictures"
    When validate CreateMovieCommand
	Then validation is successful
	

@create-movie-with-empty-editor
Scenario: Create movie with empty editor
    Given the label "Dune"
    And the release date "06/02/1985"
    And the support "physical"
    And the imageUrl "localhost://images/dune"
    And the director "David Lynch"
    And the editor ""
    When validate CreateMovieCommand
    Then validation failed

@create-movie-with-empty-director
Scenario: Create movie with empty director
    Given the label "Dune"
    And the release date "06/02/1985"
    And the support "physical"
    And the imageUrl "localhost://images/dune"
    And the director ""
    And the editor "Universal Pictures"
    When validate CreateMovieCommand
    Then validation failed