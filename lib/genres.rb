class Genre
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        @name = name
        @@all.push self
        self
    end

    def songs
        @songs
    end

    def add_song(song)
        song.genre = self unless song.genre
        songs.push song unless songs.include?(song)
    end

    def artists
        songs.collect{|x| x.artist}.uniq
    end

end