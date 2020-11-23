class Song

    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        self.name = name
        self.artist = artist
        self.genre = genre
        save
    end

    def artist=(artist)
        if artist
            @artist = artist
            artist.add_song(self)
        end
    end

    def genre=(genre)
        if genre
            @genre = genre
            genre.add_song(self)
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
    end

    def self.find_by_name(name)
        @@all.detect {|song| song.name == name }
    end

    def self.find_or_create_by_name(name)
        song = self.find_by_name(name)
        song ? song : self.create(name)
    end

    def self.new_from_filename(file)
        file = file.delete_suffix(".mp3").split(" - ")
        song = self.find_or_create_by_name(file[1])
        song.artist = Artist.find_or_create_by_name(file[0])
        song.genre = Genre.find_or_create_by_name(file[2])
        return song
    end

    def self.create_from_filename(file)
        self.new_from_filename(file)
    end
        

end