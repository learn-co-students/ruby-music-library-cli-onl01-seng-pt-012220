require_relative '../lib/artist.rb'
require_relative '../lib/genre.rb'

class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end

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

  def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
      genre.add_song(self)
    end
  end

end
