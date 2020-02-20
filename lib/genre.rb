require_relative '../lib/song.rb'

class Genre
  attr_accessor :name, :artists, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
      @songs << song
    end
  end

end
