require 'pry'

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song 
  end
  
  #this and "self.artist=(artist) if artist != nil" 
  #dictates the relationship between Song(class) and Artist(class)
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  #this and "self.genre=(genre) if genre != nil" 
  #dictates the relationship between Song(class) and Genre(class)
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  #findable song (rspec spec/007_findable_songs_spec.rb)
  def self.find_by_name(name)
    @@all.find do |song| 
      song.name == name
    end
  end
  
  def self.find_or_create_by_name (song_name)
    result = self.find_by_name(song_name)
    if result
      return result
    else
      self.create(song_name)
    end
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
 
  
end

#NTS, check previous code. might be interfering with new code.