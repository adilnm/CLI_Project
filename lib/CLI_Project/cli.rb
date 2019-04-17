class CLIProject::Cli
  def call
   birdsList
  end
  
  def birdsList
    CLIProject::Scraper.new.getNames
    counter=1
    CLIProject::Aviary.all.each do |item|
      puts "#{counter}. #{item.name}"
      counter+=1
    end
    
  end
  
end