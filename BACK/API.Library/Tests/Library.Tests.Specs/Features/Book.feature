@NonParallelizableFeature
Feature: Book

Background: 
Given the books are
	| Label  | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
	| Label1 | 16/10/1999  | support | ImageURL | editor | author  | 0      |
	| Label2 | 13/07/1997  | support | ImageURL | editor | author  | 1      |
	| Label3 | 14/02/1954  | support | ImageURL | editor | author  | 2      |

@add-book-to-collection
Scenario: Create book
	When add book
	| Label  | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
	| Label  | 24/02/2002  | support | ImageURL | editor | author  | 3      |
	Then the books should be
	| Label  | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
	| Label1 | 16/10/1999  | support | ImageURL | editor | author  | 0      |
	| Label2 | 13/07/1997  | support | ImageURL | editor | author  | 1      |
	| Label3 | 14/02/1954  | support | ImageURL | editor | author  | 2      |
	| Label  | 24/02/2002  | support | ImageURL | editor | author  | 3      |

@remove-book-from-collection
Scenario: Delete book
    When remove book
    | Label  |
    | Label1 |
    Then the books should be
    | Label  | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
    | Label2 | 13/07/1997  | support | ImageURL | editor | author  | 1      |
	| Label3 | 14/02/1954  | support | ImageURL | editor | author  | 2      |