class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
   scope :same_director_model, ->(movie_director) {  
       if movie_director != ""
           where(director: movie_director)
       else 
           where("1=0")
       end
   }
end
class Movie_Edit < ActiveRecord::Migration 
  #def self.add_column
   #add_column(:movies, :director, :string)
  #end
end

