class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_prompted = gets

    while user_prompted != "exit"

      case user_prompted
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

      user_prompted = gets
    end
  end

  def list_songs
    Song.all.sort_by { |song| song.name }.each_with_index {|song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end

  def list_artists
    Artist.all.sort_by { |artist| artist.name }.each_with_index {|artist, index|
      puts "#{index + 1}. #{artist.name}"
    }
  end

  def list_genres
    Genre.all.sort_by { |genre| genre.name }.each_with_index {|genre, index|
      puts "#{index + 1}. #{genre.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_prompted = gets

    artist = Artist.find_by_name(artist_prompted)
    artist.songs.sort_by { |song| song.name }.each_with_index {|song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    } if artist != nil
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_prompted = gets

    genre = Genre.find_by_name(genre_prompted)
    genre.songs.sort_by { |song| song.name }.each_with_index {|song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    } if genre != nil
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number_prompted = gets

    Song.all.sort_by { |song| song.name }.each_with_index {|song, index|
      if song_number_prompted.to_i == index + 1
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    }
  end
end