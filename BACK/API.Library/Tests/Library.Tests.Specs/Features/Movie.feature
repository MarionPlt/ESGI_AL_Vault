@NonParallelizableFeature
Feature: Movie

Background:
    Given the movies are
    | Label  | ReleaseDate | Support  | ImageURL | Director | Editor |
    | Label1 | 16/10/1999  | support | ImageURL | director | editor |
    | Label2 | 16/10/2000  | support | ImageURL | director | editor |

@add-videogames-to-collection
Scenario: Create Movie
	When add a movie
    | Label  | ReleaseDate | Support  | ImageURL | Director | Editor |
    | Label3 | 16/10/2001  | support2 | ImageURL | director | editor |
	Then the movies should be
    | Label  | ReleaseDate | Support  | ImageURL | Director | Editor |
    | Label1 | 16/10/1999  | support  | ImageURL | director | editor |
    | Label2 | 16/10/2000  | support  | ImageURL | director | editor |
    | Label3 | 16/10/2001  | support2 | ImageURL | director | editor |
