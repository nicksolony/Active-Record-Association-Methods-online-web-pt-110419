require 'pry'
class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre
    self.songs.uniq {|song| song.artist}.count
  end

  def all_artist_names
   #binding.pry
    # return an array of strings containing every musician's name
    songs.uniq {|song| song.artist}.map { |song| song.artist.name}
  end
end
