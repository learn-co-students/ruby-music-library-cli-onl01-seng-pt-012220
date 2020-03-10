require 'pry'

class MusicImporter
  
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    Dir.entries(@path).select {|file| file.include?("mp3")}
    # @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  end
  
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
  
  
end