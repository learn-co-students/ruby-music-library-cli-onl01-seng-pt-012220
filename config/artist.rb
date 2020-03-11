
class Artist 
  attr_accessor :name, :artist, :songs, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.name
    name
  end
  
  def self.name=(name)
    @name = name
  end
  
  def self.all
   @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def self.add_song(song)
    song.artist = self
    @songs << song 
  end
  
  def self.songs
    @songs = []
    @songs << Song.all.select {|song| song.artist == self}
    @songs
  end
  
  def self.genres 
     genres = []
    @songs.each do |song|
      if
   end
    
end
