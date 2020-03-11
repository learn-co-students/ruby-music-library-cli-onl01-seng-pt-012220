
class Genre 
    attr_accessor :name, :artist, :songs, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @artist = artist 
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
    song = self.new(name)
    song.save
    song
  end
end
    