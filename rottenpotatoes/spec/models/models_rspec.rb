require 'rails_helper'

 describe 'movies create exist' do
    it 'should be defined' do
      expect { Movie.create }.not_to raise_error
    end
end
 describe 'Model: create movies and' do
     it 'update movies' do
      # | Star Wars    | PG     | George Lucas |   1977-05-25 |
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
      
      movie_params = Hash.new
      movie_params[:director] = "Ridley Scott"
      Movie.update(3,movie_params)
      
      @movie = Movie.find 3
      expect(@movie.director).to eq("Ridley Scott")
      expect(@movie.director).not_to eq("")
    end
    
    it 'find movie with same director (when there is a director)' do
      # | Star Wars    | PG     | George Lucas |   1977-05-25 |
      movie_params1 = Hash.new
      movie_params1[:id] = "1"
      movie_params1[:rating] = "PG"
      movie_params1[:title] = "Star Wars"
      movie_params1[:director] = "George Lucas"
      movie_params1[:release_date] = "1977-05-25"
      movie_params1[:description] = ""
      Movie.create!(movie_params1)
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
      movie_params3 = Hash.new
      movie_params3[:id] = "3"
      movie_params3[:rating] = "R"
      movie_params3[:title] = "Alien"
      movie_params3[:director] = ""
      movie_params3[:release_date] = "1979-05-25"
      movie_params3[:description] = ""
      Movie.create!(movie_params3)
      # | THX-1138     | R      | George Lucas |   1971-03-11 |
      movie_params4 = Hash.new
      movie_params4[:id] = "4"
      movie_params4[:rating] = "R"
      movie_params4[:title] = "THX-1138"
      movie_params4[:director] = "George Lucas"
      movie_params4[:release_date] = "1971-03-11"
      movie_params4[:description] = ""
      Movie.create!(movie_params4)
      
      @movie = Movie.same_director_model(movie_params4[:director])
      expect(@movie[0].title).to eq(movie_params1[:title])
      expect(@movie[1].title).to eq(movie_params4[:title])
      
      expect(@movie.count).to eq(2)
     # expect(@movie.title).to eq(movie_params4[:title])
    end
     it 'does not find movie with different director (when there is a director)' do
      # | Star Wars    | PG     | George Lucas |   1977-05-25 |
      movie_params1 = Hash.new
      movie_params1[:id] = "1"
      movie_params1[:rating] = "PG"
      movie_params1[:title] = "Star Wars"
      movie_params1[:director] = "George Lucas"
      movie_params1[:release_date] = "1977-05-25"
      movie_params1[:description] = ""
      Movie.create!(movie_params1)
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
      movie_params3 = Hash.new
      movie_params3[:id] = "3"
      movie_params3[:rating] = "R"
      movie_params3[:title] = "Alien"
      movie_params3[:director] = ""
      movie_params3[:release_date] = "1979-05-25"
      movie_params3[:description] = ""
      Movie.create!(movie_params3)
      # | THX-1138     | R      | George Lucas |   1971-03-11 |
      movie_params4 = Hash.new
      movie_params4[:id] = "4"
      movie_params4[:rating] = "R"
      movie_params4[:title] = "THX-1138"
      movie_params4[:director] = "George Lucas"
      movie_params4[:release_date] = "1971-03-11"
      movie_params4[:description] = ""
      Movie.create!(movie_params4)
      
      @movie = Movie.same_director_model(movie_params4[:director])
      
      expect(@movie[0].title).not_to eq(movie_params2[:title])
      expect(@movie[1].title).not_to eq(movie_params2[:title])
     # expect(@movie.title).to eq(movie_params4[:title])
    end
    it 'cant find similar movies if we dont know director (sad path)  (when there is no director)' do
      # | Star Wars    | PG     | George Lucas |   1977-05-25 |
      movie_params1 = Hash.new
      movie_params1[:id] = "1"
      movie_params1[:rating] = "PG"
      movie_params1[:title] = "Star Wars"
      movie_params1[:director] = "George Lucas"
      movie_params1[:release_date] = "1977-05-25"
      movie_params1[:description] = ""
      Movie.create!(movie_params1)
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
      movie_params3 = Hash.new
      movie_params3[:id] = "3"
      movie_params3[:rating] = "R"
      movie_params3[:title] = "Alien"
      movie_params3[:director] = ""
      movie_params3[:release_date] = "1979-05-25"
      movie_params3[:description] = ""
      Movie.create!(movie_params3)
      # | THX-1138     | R      | George Lucas |   1971-03-11 |
      movie_params4 = Hash.new
      movie_params4[:id] = "4"
      movie_params4[:rating] = "R"
      movie_params4[:title] = "THX-1138"
      movie_params4[:director] = "George Lucas"
      movie_params4[:release_date] = "1971-03-11"
      movie_params4[:description] = ""
      Movie.create!(movie_params4)
      
      @movie = Movie.same_director_model(movie_params3[:director])
      expect(@movie.count).to eq(0)
    end
end



