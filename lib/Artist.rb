require 'pry'

class Artist
  attr_accessor :name
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
    # binding.pry
    # a= self.new(name)
    # a.save
    # @@all << self
    a = self.new(name)
    a
    # @@all.last
  end
  
  # binding.pry
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    songs.map {|song| song.genre}.uniq
  end
  
  
  
end

















# class Artist
#   attr_accessor :name
  
#   @@all = []
  
#   def initialize(name)
#     @name = name
#     @@all << self
#     @songs = []
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
  
#   def songs
#     @songs
#   end
  
#   def add_song(song)
#     song.artist = self unless song.artist == self
#     @songs << song unless @songs.include?(song)
#   end
  
  
  
  
  







# end













