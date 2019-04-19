class CLIProject::Cli
  def call
    puts"Thank you for visiting the biggest Aviary in the United States. Here is a list of all the birds that we have: \n\n"
   birdsList
   displayDescription
  end
  
  def birdsList
    CLIProject::Scraper.new.getNames
    counter=1
    CLIProject::Aviary.all.each do |item|
      puts "#{counter}. #{item.name}"
      counter+=1
    end
  end
  
  def displayDescription
      puts "Please enter the number of the bird that you would like to know more information about"
      
      input=Integer(gets) rescue false
      if !input || input.to_i< 1 || input.to_i>127
        puts "your input is not valid"
        displayDescription
      else
      input=input.to_i
      end
      
      description=CLIProject::Aviary.all[input-1].getDescription
          if description==""
            puts "Sorry, we do not have a description for this perticular bird "
          else
            puts "#{description}"
          end
          
          puts "Would you like to know more about #{CLIProject::Aviary.all[input-1].name} y/n ?"
          input=gets.strip.downcase
          if input=="y"
            options
          elsif input=="n"
          displayDescription
          else 
            puts "Please enter y or n"
          end
      end
  
      def options(bird)
        print " 1.distribution \n 2.habitat \n 3.diet \n 4.breeding,\n 5.status \n 6.funFact"
        input=gets.strip
        
      end
end