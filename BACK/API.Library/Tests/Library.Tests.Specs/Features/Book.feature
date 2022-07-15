Feature: Book
![Book](https://upload.wikimedia.org/wikipedia/commons/9/92/Open_book_nae_02.svg)
Simple calculator for adding **two** numbers

Link to a feature: [Book](Library.Tests.Specs/Features/Book.feature)

Background: 
Given the books are
	| Label  | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
	| Label1 | 16/10/1999  | support | ImageURL | editor | author  | 0      |
	| Label2 | 13/07/1997  | support | ImageURL | editor | author  | 1      |
	| Label3 | 14/02/1954  | support | ImageURL | editor | author  | 2      |

@mytag
Scenario: Create book
	When add a book
	| Label | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
	| Label | 24/02/2002  | support | ImageURL | editor | author  | 3      |
	Then the books should be
	| Label  | ReleaseDate | Support | ImageURL | Editor | Authors | Volume |
	| Label1 | 16/10/1999  | support | ImageURL | editor | author  | 0      |
	| Label2 | 13/07/1997  | support | ImageURL | editor | author  | 1      |
	| Label3 | 14/02/1954  | support | ImageURL | editor | author  | 2      |
	| Label  | 24/02/2002  | support | ImageURL | editor | author  | 3      |
