module Concerns::Findable
    
    def find_by_name(name)
        self.all.detect {|a| a.name == name }
    end

    def find_or_create_by_name(name)
        a = self.find_by_name(name)
        a ? a : self.create(name)
    end

end