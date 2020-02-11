class Genre
  
  extend Concerns::Findable

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
 
  def name
    @name
  end
  
  def name=(new_name)
    @name = new_name
  end
  
  def songs
    @songs
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
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def artists                     
     songs.collect {|song| song.artist}.uniq
  end

end