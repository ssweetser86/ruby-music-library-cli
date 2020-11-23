class Artist

    attr_accessor :name, :songs
    extend Concerns::Findable

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
        artist = self.new(name)
    end

    def add_song(song)
        if !song.artist
            song.artist = self 
        end
        self.songs << song if !songs.any?(song)
    end

    def genres
        self.songs.collect { |song| song.genre }.uniq
    end
end