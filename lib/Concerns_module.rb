module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
      obj = self.find_by_name(name)
      return obj if obj != nil
      self.create(name)
    end
  end
end