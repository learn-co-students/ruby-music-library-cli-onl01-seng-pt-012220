class Song
  attr_accessor :name, :genre, :artist
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end

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

  def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
      if genre.songs.include?(self) == false
        genre.songs << self
      end
    end
  end

  def self.new_from_filename(filename)
    parts_of_filename =[]
    new_song = nil
    parts_of_filename = filename.split(" - ")
    new_song = self.create(parts_of_filename[1])
    new_song.artist = Artist.find_or_create_by_name(parts_of_filename[0])
    new_song.genre =  Genre.find_or_create_by_name(parts_of_filename[2].chomp(".mp3"))
    new_song
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  #def self.find_by_name(name)
  #  @@all.find{|song| song.name == name}
  #end

  #def self.find_or_create_by_name(name)
  #  find_by_name(name) ? find_by_name(name) : Song.create(name)
  #end

end
