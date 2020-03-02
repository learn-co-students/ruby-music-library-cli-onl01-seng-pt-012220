def Song.new("Blank Space").name
  attr_accessor:Name, :Artist, :Genre
  @@all = []

def initialize()
  @name = name
  @@all << self
  
end

def self.all 
  @@all
  
end

def find_by_name
  
end

def find_or_create_by_name
  
end

Song.new("Song Title", artist_object, genre_object)

end

def Song.all.first 

end

def Name.Artist = self 

end 

def Add_song.new = []

end

Song.all = []

end 

Artist.all = []

end

end



require "spec_helper"

describe "Song" do
  let(:song) { Song.new("In the Aeroplane Over the Sea") }

  describe "#initialize" do
    it "accepts a name for the new song" do
      new_song = Song.new("Alison")

      new_song_name = new_song.instance_variable_get(:@name)

      expect(new_song_name).to eq("Alison")
    end
  end

  describe "#name" do
    it "retrieves the name of a song" do
      expect(song.name).to eq("In the Aeroplane Over the Sea")
    end
  end

  describe "#name=" do
    it "can set the name of a song" do
      song.name = "Jump Around"

      song_name = song.instance_variable_get(:@name)

      expect(song_name).to eq("Jump Around")
    end
  end

  describe "@@all" do
    it "is initialized as an empty array" do
      all = Song.class_variable_get(:@@all)

      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Song.all).to match_array([])

      Song.class_variable_set(:@@all, [song])

      expect(Song.all).to match_array([song])
    end
  end

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Song.class_variable_set(:@@all, [song])

      Song.destroy_all

      expect(Song.all).to match_array([])
    end
  end

  describe "#save" do
    it "adds the Song instance to the @@all class variable" do
      song.save

      expect(Song.all).to include(song)
    end
  end

  describe ".create" do
    it "initializes, saves, and returns the song" do
      created_song = Song.create("Kaohsiung Christmas")

      expect(Song.all).to include(created_song)
    end
  end
end
