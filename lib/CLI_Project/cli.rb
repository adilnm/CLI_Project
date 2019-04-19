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
    input=nil
    until input=="exit"
      puts "Please enter the number of the bird that you would like to know more information about or enter 'exit' to exit the program"
      input=gets.strip
      i=Integer(input) rescue false
      if input=="exit"
        puts"Goodbye"
      elsif !i || input.to_i< 1 || input.to_i>127
        puts "your input is not valid"
        
      else
        description(input)
      end
    end
  end
      
      def description(input)
        input=input.to_i
        description=CLIProject::Aviary.all[input-1].getDescription
          if description==""
            puts "Sorry, we do not have a description for this perticular bird "
          else
            puts "#{description}"
          end
          
          puts "Would you like to know more about #{CLIProject::Aviary.all[input-1].name} y/n ?"
          input1=nil
          until input1=="y" || input1=="n"
          input1=gets.strip.downcase
          if input1=="y"
            options(input)
          elsif input1=="n"
          else 
            puts "Please enter y or n"
          end
        end
      end
      
      def options(bird)
        puts " 1.distribution \n 2.habitat \n 3.diet \n 4.breeding,\n 5.status \n 6.funFact"
        input1=gets.strip
        case input1
          when "1"
          puts "#{CLIProject::Aviary.all[bird.to_i-1].getDistribution}"
          when "2"
          puts "#{CLIProject::Aviary.all[bird.to_i-1].getHabitat}"
          when "3"
          puts "#{CLIProject::Aviary.all[bird.to_i-1].getDiet}"
          when "4"
          puts "#{CLIProject::Aviary.all[bird.to_i-1].getBreeding}"
          when "5"
          puts "#{CLIProject::Aviary.all[bird.to_i-1].getStatus}"
          when "6"
          puts "#{CLIProject::Aviary.all[bird.to_i-1].getFunFact}"
        end
          puts "Would you like to know more about #{CLIProject::Aviary.all[bird.to_i-1].name} y/n ?"
           input=gets.strip.downcase
            input=="y" ? options(bird): displayDescription
      end
end