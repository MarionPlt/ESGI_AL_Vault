Feature: VideoGame

@create-videogame-with-valid-data
Scenario: Create videogame with valid data
    Given the label "E.T."
    And the release date "01/12/1982"
    And the support "physical"
    And the imageUrl "localhost://images/E.T."
    And the platform "Atari"
    When validate CreateVideoGameCommand
	Then validation is successful
	

@create-videogame-with-empty-platform
Scenario: Create videogame with empty platform
    Given the label "E.T."
    And the release date "01/12/1982"
    And the support "physical"
    And the imageUrl "localhost://images/E.T."
    And the platform ""
    When validate CreateVideoGameCommand
    Then validation failed

