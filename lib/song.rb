class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    self.name = name
    self
  end

  def self.create_by_name(name)
    self.name = name
    @@all << self
    self
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    result ? result : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    artist, title, extension = filename.split(/[-.]+/)
    self.name = title.strip
    self.artist_name = artist.strip
    self
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    @@all << self
    self
  end

  def self.destroy_all
    @@all = []
  end
end
