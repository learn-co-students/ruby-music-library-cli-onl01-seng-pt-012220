class Artist
  extend Concerns::Findable, Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
   @@all
  end
  
  def add_song(song)
    song.artist = self unless song.artist
   
    @songs << song unless @songs.include?(song)
  end
  
  def songs
    @songs
  end
  
  def genres 
    genres = @songs.collect {|song| song.genre}
    genres.uniq
  end
end