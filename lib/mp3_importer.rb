class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(@path).delete_if do |song|
            !song.end_with?("mp3")
        end
    end

    def import 
        files.each do |file|
            Song.new_by_filename(file)
        end
    end

end