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
    Song.new.tap{|song| song.save}
  end

  def self.new_by_name(name)
    Song.new.tap do |song|
      song.name = name
    end
  end

  def self.create_by_name(name)
    self.new_by_name(name).tap {|song| song.save}
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    song = Song.new_by_name(arr[1].chomp(".mp3"))
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap {|song| song.save}
  end

  def self.destroy_all
    @@all.clear
  end



end
