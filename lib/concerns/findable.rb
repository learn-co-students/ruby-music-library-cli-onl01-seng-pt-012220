require 'pry'
module Concerns::Findable

    def find_by_name(name)
        # binding.pry
        all.detect{|song| song.name}
    end

    def find_or_create_by_name(name)
        find_by_name(name) == nil ? create(name) : find_by_name(name)
    end
end
