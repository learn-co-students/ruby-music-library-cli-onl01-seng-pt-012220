require_relative '../lib/artist'
require_relative '../lib/genre'

class Song
  include Concerns::ClassMethods
  attr_accessor :name, :artist, :genre
  @@all = []

  ## Instance methods
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    save
  end
  def save
    @@all << self
  end

  def self.artist=(name)
    Artist.new(name).add_song(self)
  end

  ## class methods
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def self.count
    self.all.count
  end
  def self.find_by_name(name)
    self.all.detect {|a| a.name == name}
  end
  def self.create(name)
    self.new(name)
  end


end
