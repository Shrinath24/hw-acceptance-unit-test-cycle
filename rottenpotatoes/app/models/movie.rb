class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end
class Movie_Edit < ActiveRecord::Migration 
  #def self.add_column
    add_column(:movies, :director, :string, limit: 20)
 # end
end

