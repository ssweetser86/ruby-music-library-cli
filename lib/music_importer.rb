class MusicImporter

    attr_accessor :path
    
    def initialize(path)
        self.path = path
    end

    def files
        file_names = Dir.glob(self.path + "/*.mp3")
        return file_names.each { |file| file.slice! (self.path + "/")}
    end

    def import
        self.files.each do |file_path|
            Song.create_from_filename(file_path)
        end
    end
end