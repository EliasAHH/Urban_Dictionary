class UrbanDictionary::Api

    def self.fetch(term)
         url = "http://urbanscraper.herokuapp.com/search/#{term}"
         response = HTTParty.get(url)
         if !response.empty?
            term_instance = UrbanDictionary::Term.new(term)
            response.each do |d|
                definition = d["definition"]
                example = d["example"]
                UrbanDictionary::Definition.new(definition,example,term_instance)
             end
         else 
            puts "Sorry, we couldn't find something with this term. Please check spelling and type below"
            input = gets.chomp
            self.fetch(input)
         end 
    end 
end 