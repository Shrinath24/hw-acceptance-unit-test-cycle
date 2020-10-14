require 'rails_helper'

describe MoviesController do
    
 describe 'find movie with same director (when there is a director)' do
    it 'should get correct movie details' do
      movie_params = Hash.new
      movie_params[:id] = "1"
      movie_params[:rating] = "PG"
      movie_params[:title] = "Star Wars"
      movie_params[:director] = "George Lucas"
      movie_params[:release_date] = "1977-05-25"
      movie_params[:description] = ""
      Movie.create!(movie_params)
      # | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      movie_params2 = Hash.new
      movie_params2[:id] = "2"
      movie_params2[:rating] = "PG"
      movie_params2[:title] = "Blade Runner"
      movie_params2[:director] = "Ridley Scott"
      movie_params2[:release_date] = "1982-06-25"
      movie_params2[:description] = ""
      Movie.create!(movie_params2)
      # | Alien        | R      |              |   1979-05-25 |
      movie_params = Hash.new
      movie_params[:id] = "3"
      movie_params[:rating] = "R"
      movie_params[:title] = "Alien"
      movie_params[:director] = ""
      movie_params[:release_date] = "1979-05-25"
      movie_params[:description] = ""
      Movie.create!(movie_params)
      # | THX-1138     | R      | George Lucas |   1971-03-11 |
      movie_params = Hash.new
      movie_params[:id] = "4"
      movie_params[:rating] = "R"
      movie_params[:title] = "THX-1138"
      movie_params[:director] = "George Lucas"
      movie_params[:release_date] = "1971-03-11"
      movie_params[:description] = ""
      Movie.create!(movie_params)

      expect(Movie).to receive(:same_director_model).with(movie_params2[:director])
      get :same_director_movies, { id: movie_params2[:id] }
    end
end
  describe 'find movie with same director (when there is a director)' do
    it 'should call similar movies' do
      movie_params1 = Hash.new
      movie_params1[:id] = "1"
      movie_params1[:rating] = "PG"
      movie_params1[:title] = "Star Wars"
      movie_params1[:director] = "George Lucas"
      movie_params1[:release_date] = "1977-05-25"
      movie_params1[:description] = ""
      Movie.create!(movie_params1)
      # | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      movie_params = Hash.new
      movie_params[:id] = "2"
      movie_params[:rating] = "PG"
      movie_params[:title] = "Blade Runner"
      movie_params[:director] = "Ridley Scott"
      movie_params[:release_date] = "1982-06-25"
      movie_params[:description] = ""
      Movie.create!(movie_params)
      # | Alien        | R      |              |   1979-05-25 |
      movie_params = Hash.new
      movie_params[:id] = "3"
      movie_params[:rating] = "R"
      movie_params[:title] = "Alien"
      movie_params[:director] = ""
      movie_params[:release_date] = "1979-05-25"
      movie_params[:description] = ""
      Movie.create!(movie_params)
      # | THX-1138     | R      | George Lucas |   1971-03-11 |
      movie_params4 = Hash.new
      movie_params4[:id] = "4"
      movie_params4[:rating] = "R"
      movie_params4[:title] = "THX-1138"
      movie_params4[:director] = "George Lucas"
      movie_params4[:release_date] = "1971-03-11"
      movie_params4[:description] = ""
      Movie.create!(movie_params4)

      movies = [ movie_params1[:title], movie_params4[:title]]
      expect(Movie).to receive(:same_director_model).with(movie_params1[:director]).and_return(movies)
      get :same_director_movies, { id: movie_params1[:id] }
    end
end

  describe 'when there is no director' do
    it 'should call similar movies' do
      movie_params = Hash.new
      movie_params[:id] = "1"
      movie_params[:rating] = "PG"
      movie_params[:title] = "Star Wars"
      movie_params[:director] = "George Lucas"
      movie_params[:release_date] = "1977-05-25"
      movie_params[:description] = ""
      Movie.create!(movie_params)
      # | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      movie_params = Hash.new
      movie_params[:id] = "2"
      movie_params[:rating] = "PG"
      movie_params[:title] = "Blade Runner"
      movie_params[:director] = "Ridley Scott"
      movie_params[:release_date] = "1982-06-25"
      movie_params[:description] = ""
      Movie.create!(movie_params)
      # | Alien        | R      |              |   1979-05-25 |
      movie_params3 = Hash.new
      movie_params3[:id] = "3"
      movie_params3[:rating] = "R"
      movie_params3[:title] = "Alien"
      movie_params3[:director] = ""
      movie_params3[:release_date] = "1979-05-25"
      movie_params3[:description] = ""
      Movie.create!(movie_params3)
      # | THX-1138     | R      | George Lucas |   1971-03-11 |
      movie_params = Hash.new
      movie_params[:id] = "4"
      movie_params[:rating] = "R"
      movie_params[:title] = "THX-1138"
      movie_params[:director] = "George Lucas"
      movie_params[:release_date] = "1971-03-11"
      movie_params[:description] = ""
      Movie.create!(movie_params)

      get :same_director_movies, { id: movie_params3[:id] }
      expect(response).to redirect_to(movies_path)
    end
  end
end