Feature: User

@create-user-with-valid-data
Scenario: Create User with valid data
    Given the userName "Jean"
    When validate CreateUserCommand
    Then validation is successful

@create-user-with-empty-userName
Scenario: Create User with empty userName
    Given the userName ""
    When validate CreateUserCommand 
    Then validation failed
