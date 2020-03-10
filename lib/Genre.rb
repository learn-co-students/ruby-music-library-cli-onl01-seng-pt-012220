class Genre
  attr_accessor :name, :artist, :song
  extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
    
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
    # @@all << self
    b = self.new(name)
    
    b
    # binding.pry
    # a= self.new(name)
    # a.save
    # @@all.last
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end
  
  def artists
    songs.map {|song| song.artist}.uniq
  end
  
end
































# class Genre
  
#   attr_accessor :name
  
#   @@all = []
  
#   def initialize(name)
#     @name = name
#     @@all << self
#   end
  
#   def self.all
#     @@all
#   end
  
#   def self.destroy_all
#     @@all.clear
#   end
  
#   def save
#     @@all << self
#   end
  
#   def self.create(name)
#     self.new(name)
#     self
#   end
  
  
  
# end