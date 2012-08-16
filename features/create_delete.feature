Feature: create and delete movie entries

  As a movie buff
  So that I can increase the value of the repository to the community
  I want to add and remove movies
  
  Missing - Cannot interact with pop up dialog to confirm movie deletion.

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Chocolat     | PG-13  |              | 2001-01-05   |
  | Star Wars    | PG     | George Lucas | 1977-05-25   |
  | Blade Runner | PG     | Ridley Scott | 1982-06-25   |
  | Alien        | R      |              | 1979-05-25   |
  | THX-1138     | R      | George Lucas | 1971-03-11   |
  
  And  I am on the RottenPotatoes home page

Scenario: create a missing movie
  When I check the following ratings: ratings_G, ratings_PG, ratings_R
    And I uncheck the following ratings: ratings_PG-13, ratings_NC-17
  When I press "ratings_submit"
  Then I should see "Alien"
  When  I follow "Add new movie"
  Then  I should be on Create New Movie page
  When  I fill in "Title" with "Voila Software"
    And I press "Save Changes"
  Then I should be on the home page
    And I should see "Voila Software"

Scenario: delete an existing movie
  When I go to the details page for "Alien"
    And I press "Delete"
  Then I should be on the home page
    And I should see "Alien"

