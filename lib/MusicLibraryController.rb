class MusicLibraryController
    @@ChoiceMessages = ["Welcome to your music library!",
    "To list all of your songs, enter 'list songs'.", 
    "To list all of the artists in your library, enter 'list artists'.", 
    "To list all of the genres in your library, enter 'list genres'.", 
    "To list all of the songs by a particular artist, enter 'list artist'.", 
    "To list all of the songs of a particular genre, enter 'list genre'.", 
    "To play a song, enter 'play song'.", 
    "To quit, type 'exit'.", 
    "What would you like to do?"]

    def initialize(path = './db/mp3s')
        @path = path
        music_importer = MusicImporter.new(@path)
        music_importer.import
    end

    def call
        @@ChoiceMessages.each do |message|
            puts message
        end
        input = gets.strip
        while input != 'exit'
            list_songs if input == 'list songs'
            
            list_artists if input == 'list artists'
    
            list_genres if input == 'list genres'
    
            list_songs_by_artist if input == 'list artist'
    
            list_songs_by_genre if input == 'list genre'
    
            play_song if input == 'play song'

            puts "What else would you like to do: "
            input = gets.strip
            puts "\n"
        end
        puts "\nThanks For Using The App!"
    end



    def organize(array)
        oragnized_ary = array.sort{|a, b| a.name<=>b.name}
        oragnized_ary
    end

    def list_songs
        organized_songs = organize(Song.all)
        organized_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        puts "\n"
    end

    def list_song
        organized_songs = organize(Song.all)
        organized_songs
    end

    def list_artists
        organized_artists = organize(Artist.all)
        organized_artists.each_with_index do |art, index|
            puts "#{index + 1}. #{art.name}"
        end
        puts "\n"
    end

    def list_genres
        organized_genres = organize(Genre.all)
        organized_genres.each_with_index do |gen, index|
            puts "#{index + 1}. #{gen.name}"
        end
        puts "\n"
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        search = gets.strip
        artist = Artist.find_or_create_by_name(search)
        organized_songs = organize(artist.songs)
        organized_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
        puts "\n"
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        search = gets.strip
        genre = Genre.find_or_create_by_name(search)
        organized_songs = organize(genre.songs)
        organized_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
        puts "\n"
    end

    def play_song
        list = list_song
        puts "Which song number would you like to play?"
        input = gets.strip
        if input.to_i >= 1 and input.to_i <= list.length
            index = input.to_i - 1
            if list[index] != nil
                song = list[index].name
                artist = list[index].artist.name
                puts "Playing #{song} by #{artist}\n"
            end
        end
    end
    
end