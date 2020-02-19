
class Genre
  include Concerns::ClassMethods
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    save
  end
  def save
    @@all << self
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def self.count
    self.all.count
  end
  def self.find_by_name(name)
    self.all.detect {|a| a.name == name}
  end
  def self.create(name)
    self.new(name)
  end

end
