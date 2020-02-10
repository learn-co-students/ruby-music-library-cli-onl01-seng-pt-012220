class MusicImporter

    attr_accessor :path
    
    def initialize(file_path)
        @path = file_path
    end

    def files
        current_dir = Dir.getwd
        Dir.chdir(@path)
        filenames = Dir.glob("*.mp3")
        Dir.chdir(current_dir)
        filenames
    end

    def import
        filenames = self.files
        filenames.each do |file|
            Song.create_from_filename(file)
        end
    end



end