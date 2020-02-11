class Artist
  
  extend Concerns::Findable

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
 
  def name
    @name
  end
  
  def name=(new_name)
    @name = new_name
  end
    
  def songs
    @songs
  end
    
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
  
   def genres
    self.songs.map {|song|song.genre}.uniq
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

end