class Song
  extend Concerns::Findable
  attr_accessor :name,:artist,:genre
  
  @@all=[]
  def initialize(name,artist=nil,genre=nil)
    @name =name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
   
  def self.create(song)
      new_song=self.new(song)
      new_song.save
      new_song
  end 
   
  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre=genre
    if genre.songs.include?(self)==false
      genre.songs << self 
   end 
 end 
 
  def self.find_by_name(name)
     @@all.detect{|song| song.name==name}
  end 
 
  def self.find_or_create_by_name(name)
    (find_by_name(name) || create(name))
  end 
  
  def self.new_from_filename(filename)
    part= filename.split(" - ")
    name=part[1]
    genre=Genre.find_or_create_by_name(part[2].gsub(".mp3",""))
    artist=Artist.find_or_create_by_name(part[0])
     make_from_files =self.new(name,artist,genre)
     make_from_files
  end 
  
  def self.create_from_filename(filename)
   new_from_filename(filename).tap{|file| file.save}
  end 
    
  
end 