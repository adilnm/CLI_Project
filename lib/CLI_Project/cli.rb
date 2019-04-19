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
    # input=nil
    # until input=="exit"
      puts "Please enter the number of the bird that you would like to know more information about or enter 'exit' to exit the program"
      input=gets.strip
      i=Integer(input) rescue false
      if input=="exit"
        puts"Goodbye"
      elsif !i || input.to_i< 1 || input.to_i>127
        puts "your input is not valid"
        displayDescription
      else
        description(input.to_i)
        moreInfo(input.to_i)
      end
    # end
  end
      
      def description(input)
        description=CLIProject::Aviary.all[input-1].getDescription
          if description==""
            puts "Sorry, we do not have a description for this particular bird "
          else
            puts "#{description}\n\n"
          end
     end
      
      def moreInfo(input)
          puts "Would you like to know more about #{CLIProject::Aviary.all[input-1].name} y/n ?"
          input1=nil
          until input1=="y" || input1=="n"
          input1=gets.strip.downcase
          if input1=="y"
            options(input)
          elsif input1=="n"
          displayDescription
          else 
            puts "Please enter y or n"
          end
        end
      end
      
      def options(input)
        puts "Please pick one of the options below: "
        puts " 1.distribution \n 2.habitat \n 3.diet \n 4.breeding\n 5.status \n 6.funFact"
        input1=gets.strip
        case input1
          when "1"
          puts "#{CLIProject::Aviary.all[input.to_i-1].getDistribution}\n\n"
          when "2"
          puts "#{CLIProject::Aviary.all[input.to_i-1].getHabitat}\n\n"
          when "3"
          puts "#{CLIProject::Aviary.all[input.to_i-1].getDiet}\n\n"
          when "4"
          puts "#{CLIProject::Aviary.all[input.to_i-1].getBreeding}\n\n"
          when "5"
          puts "#{CLIProject::Aviary.all[input.to_i-1].getStatus}\n\n"
          when "6"
          puts "#{CLIProject::Aviary.all[input.to_i-1].getFunFact}\n\n"
        end
          puts "Would you like to know more about #{CLIProject::Aviary.all[input.to_i-1].name} y/n ?"
           input=gets.strip.downcase
            input=="y" ? options(bird): displayDescription
      end
end