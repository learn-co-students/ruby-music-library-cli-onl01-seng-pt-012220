
class Artist
  include Concerns::ClassMethods
  attr_accessor :name, :songs
  @@all = []

  ##instance methods
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  def save
    @@all << self
  end
  def add_song(song)
    if song.artist.class != self.class
      song.artist = self
      @songs << song
    end
  end

  ## Class methods
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
