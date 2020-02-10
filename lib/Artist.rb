class Artist
    extend Concerns::Findable
    
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(new_song)
        @songs << new_song unless @songs.include?(new_song)
        new_song.artist = self unless new_song.artist == self
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end

    def genres
        @songs.collect{|song| song.genre}.uniq
    end
end