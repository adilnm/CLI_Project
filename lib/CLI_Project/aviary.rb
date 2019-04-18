class CLIProject::Aviary
  
  attr_accessor :name, :url, :description, :distribution, :habitat, :diet, :breeding, :status, :funFact
  @@all=[]
  def initialize (name=nil, url=nil,description=nil,distribution=nil,habitat=nil,diet=nil,breeding=nil,status=nil,funFact=nil)
    @name=name
    @url=url
    # @description=description
    # @distribution=distribution
    # @habitat=habitat
    # @diet=diet
    # @breeding=breeding
    # @status=status
    # @funFact=funFact
     @@all<< self
  end
  
  def self.all
    @@all
  end
  
  def doc
    Nokogiri::HTML(open(self.url))
  end
  
  def getDistribution
     @distribution=doc.css("div.rightCol p").first.text
  end
  
end
  