class MusicImporter
  
  

  def initialize(path)
    @path = path
  end
  def path
    @path
  end

  def files
    Dir[@path+"/*.mp3"].map { |file| file.split("/").last }
  end

  def import()
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end 