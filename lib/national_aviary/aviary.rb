class NationalAviary::Aviary
  
  attr_accessor :name, :url, :description, :distribution, :habitat, :diet, :breeding, :status, :funFact
  @@all = []
  def initialize (name = nil, url = nil,description = nil,distribution = nil,habitat = nil,diet = nil,breeding = nil,status = nil,funFact = nil)
    @name = name
    @url = url
    @@all<< self
  end
  
  def self.all
    @@all
  end
  
  def doc
    Nokogiri::HTML(open(self.url))
  end
  
  def getDistribution
     @distribution = doc.css("div.rightCol p").first.text
  end
  
  def getDescription
     @description = doc.css("div.centerContent p").text
  end
  
  def getHabitat
     @habitat = doc.css("div.rightCol p")[1].text
  end
  
  def getDiet
     @diet = doc.css("div.rightCol p")[2].text
  end
  
  def getBreeding
     @breeding = doc.css("div.rightCol p")[3].text
  end
  
  def getStatus
     @status = doc.css("div.rightCol p")[4].text
  end
  
  def getFunFact
     @funFact = doc.css("div.funFact").text.gsub("FUN FACT","").strip
  end

 
  
end
  