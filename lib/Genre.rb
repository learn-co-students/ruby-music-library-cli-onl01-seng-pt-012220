class Genre
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

    def save
        @@all << self
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        new_genre = Genre.new(name)
        new_genre.save
        new_genre
    end

    def add_song(new_song)
        @songs << new_song unless @songs.include?(new_song)
        new_song.genre = self unless new_song.genre == self 
    end

    def artists
        @songs.collect{|song| song.artist}.uniq
    end
end