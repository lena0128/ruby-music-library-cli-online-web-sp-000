require 'pry'

class MusicImporter
 attr_reader :path

def initialize(path)
  @path = path
end

def files
  Dir.chdir(@path) do |path|
    Dir.glob("*.mp3")
  end
end

def import
files.each do |file|
  song = Song.create_from_filename(file)
end
end

end
