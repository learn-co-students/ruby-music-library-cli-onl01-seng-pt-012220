class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    fs = []
    fs = %x|ls #{@path}/|
    @files = fs.split("\n")
  end

  def import
    self.files
    @files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
