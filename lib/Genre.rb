class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all.push(self)
  end

  def self.create(name)
    self.new(name)
  end

  def add_song(song)
    @songs.push(song) if @songs.include?(song) == false
    song.genre ||= self
  end

  def artists
    artists_from_songs = []
    @songs.each{|song|
      artists_from_songs.push(song.artist) if artists_from_songs.include?(song.artist) == false
    }
    return artists_from_songs
  end
end
