require 'pry'

module Concerns::Findable
  
  def find_by_name(name)
    all.find{|a| a.name == name}
  end
  
  def create(name)
    a = new(name)
    a
  end
  
  def find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      # binding.pry
      self.create(name)
    end
    
    # find_by_name(name) || self.create(name)
    # binding.pry
  end
  
  # binding.pry
  
  
  
  
end