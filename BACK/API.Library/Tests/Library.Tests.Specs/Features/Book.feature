Feature: Book

@create-book-with-valid-data
Scenario: Create book with valid data
    Given the label "Foundation"
    And the release date "01/01/1957"
    And the support "physical"
    And the imageUrl "localhost://images/foundation"
    And the editor "Gnome Press"
    And the author "Isaac Asimov"
    And the volume 1
    When validate CreateBookCommand
	Then validation is successful
	

@create-book-with-empty-author
Scenario: Create book with empty author
    Given the label "Foundation"
    And the release date "01/01/1957"
    And the support "physical"
    And the imageUrl "localhost://images/foundation"
    And the editor "Gnome Press"
    And the author ""
    And the volume 1
    When validate CreateBookCommand
    Then validation failed

    @create-book-with-empty-editor
Scenario: Create book with empty editor
    Given the label "Foundation"
    And the release date "01/01/1957"
    And the support "physical"
    And the imageUrl "localhost://images/foundation"
    And the editor ""
    And the author "Isaac Asimov"
    And the volume 1
    When validate CreateBookCommand
    Then validation failed

    @create-book-with-empty-editor
Scenario: Create book with negative volume
    Given the label "Foundation"
    And the release date "01/01/1957"
    And the support "physical"
    And the imageUrl "localhost://images/foundation"
    And the editor "Gnome Press"
    And the author "Isaac Asimov"
    And the volume -1
    When validate CreateBookCommand
    Then validation failed

