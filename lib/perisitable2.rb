module Persistable

module InstanceMethods
  def save
    self.class.all << self
  end
end

  module ClassMethods
    def reset_all
      self.all.clear
    end

    def count
      self.all.size
    end
  end

end
