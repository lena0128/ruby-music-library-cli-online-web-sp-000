class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

def initialize(name)
  @name = name
  @songs = []
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
  artist.save
  artist
end

# interaction with other classes below

def self.find_or_create_by_name(name)
   the_artist = self.all.detect { |artist| artist.name == name }
     if the_artist
       the_artist
     else
       self.new(name)
     end
end

def add_song(song)
  song.artist = self if song.artist ==nil
  @songs << song if self.songs.include?(song) == false
end

def songs
@songs
end

def genres
  self.songs.collect { |song| song.genre }.uniq
end

end
