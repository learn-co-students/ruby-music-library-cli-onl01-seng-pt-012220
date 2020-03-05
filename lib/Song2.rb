class Song
    # adding :artist to the attr_accessor allows both #artist test and #artist= test to pass
attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name= name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push self unless genre.songs.include? self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.artist
    add_song(song) << self
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name } #Work in progress

  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name) # this will either be an actual song, or nil
    if song.nil?
      create(name)
    else
      song
    end
  end

  def self.new_from_filename(name)
    artist, song, genre_name = name.split(" - ")
    fixed_name = genre_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_name)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save 
  end

end
