require 'spec_helper'

describe MoviesController do
  describe 'Directed By' do
    
    it 'should call the model method that performs search for movie' do
      Movie.should_receive(:find_by_title).with('foo')
      get :directed_by, {:title => 'foo'}
    end
    
    it 'should call the model method that performs search for director' do
      fake_movie = mock('Movie')
      fake_movie.stub(:director).and_return('bar')
      Movie.should_receive(:find_by_title).with('foo').and_return(fake_movie)
      Movie.should_receive(:find_all_by_director)
      get :directed_by, {:title => 'foo'}
    end
    
    it 'should select the Search Results template for rendering' do
      fake_movie = mock('Movie')
      fake_movie.stub(:director).and_return('bar')
      Movie.should_receive(:find_by_title).with('foo').and_return(fake_movie)
      fake_results = [fake_movie, fake_movie]
      Movie.stub(:find_in_movies).and_return(fake_results)
      get :directed_by, {:title => 'foo'}
      response.should render_template('directed_by')
    end
    
    it 'should make the search results available to that template' do
      fake_movie = mock('Movie')
      fake_movie.stub(:director).and_return('bar')
      Movie.should_receive(:find_by_title).with('foo').and_return(fake_movie)
      fake_results = [fake_movie, fake_movie]
      Movie.stub(:find_in_movies).and_return(fake_results)
      get :directed_by, {:title => 'foo'}
      # look for controller method to assign @movies ??
      assigns(:movies).should == fake_results
    end

  end
end
