module Concerns::Findable
  
  def find_by_name(name)
    self.all.find do |song| 
      song.name == name
    end
  end
  
  def find_or_create_by_name (song_name)
    result = self.find_by_name(song_name)
    if result
      return result
    else
      self.create(song_name)
    end
  end

  
end
