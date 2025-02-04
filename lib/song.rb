class Song
  attr_accessor :name, :artist_name
  @@all = []

 def self.create
  song = self.new
  song.save
  song
 end
 
 def self.new_by_name(name)
  song = self.new
  song.name = name
  song
 end

 def self.create_by_name(name)
  song = self.new_by_name(name)
  song.save
  song
 end

 def self.find_by_name(name)
  @@all.find{|song| song.name == name}
 end

 def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
 end

 def self.alphabetical
  @@all.sort_by{|song| song.name}
 end
 
 
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(file_name)
    #constructor
    new_file = file_name.gsub(".mp3", "").split(" - ")
    song = self.new
    song.artist_name = new_file[0]
    song.name = new_file[1]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
