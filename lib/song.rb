class Song 
  extend Concerns::Findable, Memorable::ClassMethods
  include Memorable::InstanceMethods
    
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
   
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def artist=(artist)
    @artist = artist if @artist == nil
    artist.add_song(self) if self.artist != nil
  end
  
  def genre=(genre)
    @genre = genre if @genre == nil
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def self.new_from_filename(filename)
    data = filename.delete_suffix('.mp3').split(" - ")
    title = data[1]
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2])
    
    Song.new(title, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new = self.new_from_filename(filename)
    new.save
    new
  end
end