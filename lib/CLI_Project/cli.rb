class CLIProject::Cli
  def call
    puts"Thank you for visiting the biggest Aviary in the United States. Here is a list of all the birds that we have: s"
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
    
    input=gets.strip.to_i
    description=CLIProject::Aviary.all[input-1].getDescription
    if description=""
      puts "Sorry, we do not have a description for this perticular bird "
    else
    puts "#{description}"
  end
  end
  
  
  
end