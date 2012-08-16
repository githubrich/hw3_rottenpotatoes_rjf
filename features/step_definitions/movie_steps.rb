# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create! movie
  end
  assert movies_table.hashes.size == Movie.all.count
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  titles = page.all("table#movies tbody tr td[1]").map {|t| t.text}
  if titles.count < 2
    assert(false, "Expected at least 2 movies to perform comparison.")
  elsif (titles.index(e1) == nil) or (titles.index(e2) == nil)
    assert(false, "One or both movies not present in results.")
  else
    assert titles.index(e1) < titles.index(e2)
  end
  # flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(", ")
  ratings.each do |rating|
    if uncheck == "un"
      uncheck rating
      # uncheck("ratings_#{rating}")
    else
      check rating
      # check("ratings_#{rating}")
    end
  end
end

# simple compare of body table results to data store rows
Then /I should see all of the movies/ do
  assert Movie.all.count == all("table#movies tbody tr").count
end

Then /the director of "(.*)" should be "(.*)"/ do |e1, e2|
  assert page.has_content?(e1)
  assert page.has_content?(e2)
end

Then /The movie should not have text for the (.*) field/ do |field_name|
  # puts page.all("ul#details li") => []
  assert page.all("table#movies tbody tr").count == 0
end

# Director

