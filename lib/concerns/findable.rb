module Concerns::Findable

    def find_by_name(name = nil)
        #find a song by its name
        self.all.find{|obj| obj.name == name}
    end

    
    def find_or_create_by_name(name)
        search = self.find_by_name(name)
        if search == nil
            new_obj = self.create(name) 
            new_obj
        else
            search
        end
    end

end