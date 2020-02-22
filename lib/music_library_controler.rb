class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    user_input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until user_input == "exit"
        user_input = gets
    end

  end

  def list_songs
    song_list = []
    Song.all.each do |song|
      song_list << song.name
    end
    count = 1
    song_list.sort!
    song_list.each do |song|
      this_song = Song.find_by_name(song)
      puts "#{count}. #{this_song.artist.name} - #{this_song.name} - #{this_song.genre.name}"
      count +=1
    end
  end

  def list_artists
    artist_list = []
    Artist.all.each do |artist|
      artist_list << artist.name
    end
    artist_list.sort!
    count = 1
    artist_list.each do |artist|
      puts "#{count}. #{artist}"
      count +=1
    end
  end

  def list_genres
    genre_list = []
    Genre.all.each do |genre|
      genre_list << genre.name
    end
    genre_list.sort!
    count = 1
    genre_list.each do |genre|
      puts "#{count}. #{genre}"
      count += 1
    end
  end

end
