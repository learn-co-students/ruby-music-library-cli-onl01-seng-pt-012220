#require_relative "../config/environment.rb"
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

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
    if song.artist == nil
        song.artist = self
        @songs << song
    end
  end

  def genres
    g = []
    Song.all.collect do |song|
      if song.artist == self
        g << song.genre
      end
    end
    g.uniq
  end


end
