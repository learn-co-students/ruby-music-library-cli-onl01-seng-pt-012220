class Genre
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
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

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def songs
    @songs
  end

  def artists
    to_retrun = []
    @songs.each do |song|
      if !to_retrun.include?(song.artist)
        to_retrun << song.artist
      end
    end
    to_retrun
  end
  
end