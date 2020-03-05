module Concerns

  module Findable

    # def find_by_name(name)
    #   self.all.detect{ |o| o.name == name }
    # end

    def find_by_name(name)
      self.all.find {|song| song.name == name }
    end


    def find_or_create_by_name(name)
      song = find_by_name(name) # this will either be an actual song, or nil
      if song.nil?
        create(name)
      else
        song
      end
    end

  end

end
