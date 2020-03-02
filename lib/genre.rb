class Genre 
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
  
  def songs
    @songs
  end
  
  def artists
    artists = @songs.collect {|song| song.artist}
    artists.uniq
  end
end