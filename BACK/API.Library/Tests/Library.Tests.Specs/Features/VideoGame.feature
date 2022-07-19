@NonParallelizableFeature
Feature: VideoGame

Background:
    Given the videogames are
    | Label  | ReleaseDate | Support | ImageURL | Platform |
    | Label1 | 16/10/1999  | support | ImageURL | platform |
    | Label2 | 16/10/2000  | support | ImageURL | platform |

@add-videogames-to-collection
Scenario: Create VideoGame
	When add a videogames
    | Label  | ReleaseDate | Support  | ImageURL | Platform |
    | Label3 | 16/10/2001  | support2 | ImageURL | platform |
	Then the videogames should be
    | Label  | ReleaseDate | Support  | ImageURL | Platform |
    | Label1 | 16/10/1999  | support  | ImageURL | platform |
    | Label2 | 16/10/2000  | support  | ImageURL | platform |
    | Label3 | 16/10/2001  | support2 | ImageURL | platform |
