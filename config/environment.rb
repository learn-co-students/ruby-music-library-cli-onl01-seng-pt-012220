require 'bundler'
Bundler.require

module Concerns
  module ClassMethods
    def save
      self.all.value << self
    end
    def all
      @@all
    end
    def destroy_all
      self.all.clear
    end
    def count
      self.all.count
    end
    def find_by_name(name)
      self.all.detect {|a| a.name == name}
    end
  end
end

require_all 'lib'
