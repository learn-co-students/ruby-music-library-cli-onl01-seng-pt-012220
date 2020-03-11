require 'bundler'
Bundler.require

module Concerns
end


module Concerns::Findable
  def find_by_name(name)
      self.all.find do |song|
      song.name == name
      end
   end
 
  
  def find_or_create_by_name(name) 
   if find_by_name(name) == nil 
     self.create(name)
   else
     self.find_by_name(name)
   end
  end
  
end

class Song 
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil 
  end
  
  def self.name
    @name
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
  
  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end
  
  def self.artist 
    @artist 
  end
  
  def artist=(artist)
    if @artist == nil 
      @artist = artist
      artist.add_song(self)
    else
  end
  end
  
  def self.genre
    @genre
  end
  
   def genre=(genre)
     if @genre == nil 
      @genre = genre
      genre.add_song(self)
    else
   end
  end
  
  def self.find_by_name(name)
      @@all.find do |song|
        song.name == name
      end
   end
 
  
   def self.find_or_create_by_name(name) 
   if find_by_name(name) == nil 
     create(name)
   else
     find_by_name(name)
    end
    end
  
  def self.new_from_filename(file)
    file_array = file.delete_suffix('.mp3').split(" - ")
    name = file_array [1]
    artist = Artist.find_or_create_by_name(file_array [0])
    genre = Genre.find_or_create_by_name(file_array[2])
     Song.new(name, artist, genre)
 end
 
   def self.create_from_filename(file)
     new = new_from_filename(file)
     new.save
 end
 
 
 
end


class Artist 
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.name
    @name
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
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist != nil 
    @songs << song unless @songs.include?(song) 
  end
  
  def self.songs
    @songs
    #@songs << Song.all.select {|song| song.artist == self && } unless @songs.include?song 
    #@songs
  end
  
  def genres 
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
   end
   
end


class Genre 
  extend Concerns::Findable
    attr_accessor :name, :artist, :songs, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @artist = artist 
    @songs = []
  end
  
  def self.name
    @name
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
  
  def self.songs 
    @songs
  end
  
  def add_song(song)
    song.genre = self unless song.genre != nil 
    @songs << song unless @songs.include?(song) 
  end
    
  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
   end
    
end
    

class MusicImporter
  attr_accessor :name, :artist, :genre, :path
  
  @@all = []
  
  def initialize(file)
    @path = file
    @@all << self
  end
  
  def self.path
    @file
  end
  
  def files 
    Dir.glob("#{@path}/*.mp3").collect{|file| file.gsub("#{@path}/", "")}
  end
  
  def import 
    files.each {|file| Song.create_from_filename(file)}
  end
  
end

class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call 
    
    input = ""
    
    while input != "exit"
    
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    
      input = gets.strip 
      
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
  end
   
   def list_songs 
    Song.all.sort_by{|song| song.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end
  
    def list_genres
    Genre.all.sort_by{|genre| genre.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    
     input = ""
    
    
      puts "Please enter the name of an artist:" 
    
      input = gets.strip 
      
      if Artist.find_by_name(input)
        artist = Artist.find_by_name(input)
        artist.songs.sort_by{|song|song.name}.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    
     input = ""
    
    
      puts "Please enter the name of a genre:" 
    
      input = gets.strip 
      
      if Genre.find_by_name(input)
        genre = Genre.find_by_name(input)
        genre.songs.sort_by{|song|song.name}.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    input = ""
    puts "Which song number would you like to play?" 
    input = gets.strip.to_i
    songs = []
    Song.all.sort_by{|song| song.name}.each do |song|
    songs << song
   end
    
    if input <= songs.length && input > 0 
    song = songs[input-1]
    puts "Playing #{song.name} by #{song.artist.name}"
  end
   
  end
end
      

end
require_all 'lib'
