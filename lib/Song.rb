class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        
        @name = name
        @artist = artist  
        @genre = genre 
        self.genre=(genre) if @genre!= nil
        self.artist=(artist) if @artist!=nil
    end

    def artist=(artist)
        @artist = artist
        @artist.add_song(self) unless @artist.songs.include?(self)
    end

    def genre=(genre)
        @genre = genre
        @genre.add_song(self) unless @genre.songs.include?(self)
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name, artist = nil)
        new_song = Song.new(name, artist)
        new_song.save
        new_song
    end

    def self.find_by_name(name = nil)
        #find a song by its name
        Song.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        search = Song.find_by_name(name)
        if search == nil
            new_song = Song.create(name) 
            new_song
        else
            search
        end
    end

    def self.new_from_filename(file)
        split_file = file.split(" - ")
        genre = split_file[2].split(".mp3").join
        new_instance = Song.new(split_file[1])
        new_instance.artist = Artist.find_or_create_by_name(split_file[0])
        new_instance.genre = Genre.find_or_create_by_name(genre)
        
        new_instance
    end

    def self.create_from_filename(file)
        new_song = self.new_from_filename(file)
        @@all << new_song
    end

end