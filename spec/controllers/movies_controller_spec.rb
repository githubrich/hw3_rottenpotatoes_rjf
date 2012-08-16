require 'spec_helper'

describe MoviesController do
  describe 'Directed By' do
    
    it 'should call the model method that performs search for director' do
      Movie.should_receive(:find_in_movies).with('frainier')
      get :directed_by, {:director => 'frainier'}
    end
    
    it 'should select the Search Results template for rendering' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_in_movies).and_return(fake_results)
      get :directed_by, {:director => 'frainier'}
      response.should render_template('directed_by')
    end
    
    it 'should make the search results available to that template' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_in_movies).and_return(fake_results)
      get :directed_by, {:director  => 'frainier'}
      # look for controller method to assign @movies
      # puts fake_results.to_s
      assigns(:movies).should == fake_results
    end

  end
end
