class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist=(artist) 
    self.genre=(genre)
  end
  
  def self.name
    name
  end
  
  def self.name=(name)
    @name = name
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
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.artist 
    @artist 
  end
  
  def artist=(artist)
      if @artist == nil
      @artist = artist
      @artist.add_song(self)
      else
      @artist = @artist
      end
    @artist 
  end
  
  def self.genre
    @genre
  end
  
   def self.genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
    
end
