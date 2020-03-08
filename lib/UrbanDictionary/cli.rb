class UrbanDictionary::CLI
    def start
        puts "Welcome to Urban Dictionary."
        puts "Please type in the term you would like for me to look up for you?"
        input = gets.chomp.capitalize
        UrbanDictionary::Api.fetch(input)
        display_def
        more_options
        loop_or_exit
    end 

    def display_def
        UrbanDictionary::Definition.all.each.with_index(1) do |d,index|
            sleep(1)
            puts "#{index}. #{d.definition}"
            puts "-----------------------------------------"

        end 
    end 

    def more_options
        puts "If you would like to see an example about a certain definition, please enter the number associated with that definition."
        input = gets.chomp.to_i
        index = input - 1
        user_choice = UrbanDictionary::Definition.all[index]
        puts " example : #{user_choice.example}"
    end 

    def loop_or_exit
        puts "Would you like to search more terms? enter y/n"
        input = gets.chomp.downcase
        if input == "y"
             start
        else 
            puts "Would you like to see the history of all the terms you have searched enter y/n"
            new_input = gets.chomp.downcase
            history(new_input)
        end 
    end 

    def display_all_terms
        UrbanDictionary::Term.all.each.with_index(1) do |t,index|
           puts "#{index}. #{t.term}"
        end 
    end 

    def history(input)
        if input == "y"
            display_all_terms
            loop_or_exit
        else 
            exit
        end 
    end 
end 