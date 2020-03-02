module Memorable
module InstanceMethods
  def save
    self.class.all << self
  end
end

module ClassMethods
  
  def destroy_all
    self.all.clear
  end

  def create(name)
    new = self.new(name)
    new.save
    new
  end
end
  
end