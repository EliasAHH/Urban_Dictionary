class UrbanDictionary::Definition
    #has many - belongs to relations with term
    attr_accessor :definition, :term, :example
    
    @@all = []

    def initialize(definition, example,term)
        @term = term 
        @definition = definition
        @example = example
        @@all << self 
    end 

    def self.all
        @@all  
    end 
end 