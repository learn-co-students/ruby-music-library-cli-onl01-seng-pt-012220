
require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    @@all << self
    self.artist = artist if artist
    self.genre = genre if genre
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
  
  def self.create(name)
    new_song = Song.new(name)
    new_song
    
    # self.new(name)
    # self
    
    # @@all << self 
    # # self.new(name, artist=nil, genre=nil)
    # self
  end
  
  def artist=(name)
    if @artist == nil
      @artist = name
    else
      @artist = @artist
    end
      if @artist != nil
      @artist.add_song(self)
    end
  end
  
  def genre=(name)
    if @genre == nil
      @genre = name
    else
      @genre = @genre
    end
      if @genre != nil
      @genre.add_song(self)
    end
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
    # self.all.find{|song| binding.pry}
  end
  
  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create(name)
    # end
    self.find_by_name(name) || self.create(name)
    #binding.pry
  end
  

  # def self.new_from_filename(filename)
  #   split_file = filename.chomp!(".mp3").split(" - ")
  #   artist = Artist.find_or_create_by_name(split_file[0])
  #   genre = Genre.find_or_create_by_name(split_file[2])
  #   self.new(split_file[1], artist, genre)
  # end
  
  # def self.create_from_filename(name)
  #   song = self.new_from_filename(name)
  #   song.save
  # end
  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")

    # song = self.find_or_create_by_name(name)
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)

    new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save}

  end
  
  
end






# describe ".new_from_filename" do
#     it "initializes a song based on the passed-in filename" do
#       song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
#     end




