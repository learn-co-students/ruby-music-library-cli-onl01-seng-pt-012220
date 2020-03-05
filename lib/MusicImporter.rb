class MusicImporter
attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # return all of the files in the @path directory
    # path -> /desktop/music/*.mp3
    # music folder could contain 10 files
    # we want to return an array of all of those files
    mp3_path = "#{@path}/*.mp3"
    files = Dir.glob(mp3_path)
    # files array contains strings of filenames. however, they currently contain
    # the path along with the filename (.mp3). we want to strip the path from each of these strings
    # in the array.
    files = files.each do |file|
      file.sub!("#{path}/", "")
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end




end
