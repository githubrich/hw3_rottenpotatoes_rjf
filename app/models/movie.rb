class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.find_in_movies (director)
    # director = params[:director]
    # debugger
    find_all_by_director(director, {:order => :release_date})
  end
end
