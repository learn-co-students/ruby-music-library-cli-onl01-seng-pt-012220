class Genre
  attr_accessor :name, :artists, :songs
  extend Concerns::Findable
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

  def artists
    a = []
    Song.all.collect do |song|
      if song.genre == self
        a << song.artist
      end
    end
    a.uniq
  end

end
