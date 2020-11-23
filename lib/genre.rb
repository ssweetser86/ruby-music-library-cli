class Genre
    extend Concerns::Findable


    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        self.name = name
        self.songs = []
        save
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
        genre = self.new(name)
    end

    def add_song(song)
        if !song.genre
            song.genre = self 
        end
        self.songs << song if !songs.any?(song)
    end

    def artists
        self.songs.map{ |song| song.artist }.uniq
    end
end