class Song
    attr_accessor :name
    attr_reader :artist, :genre
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self) unless genre.songs.include?(self)
    end

    def self.all
        @@all
    end

    def save
        @@all.push self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        song = new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        all.detect{|x| x.name == name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name)||create(name)
    end
end