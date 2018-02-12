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
    @@all << self
    self
  end

  def self.new_by_name(name)
    self.name = name
    @@all << self
    self
  end
end
