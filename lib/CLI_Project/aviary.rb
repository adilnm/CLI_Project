class CLIProject::Aviary
  
  attr_accessor :name, :url, :description, :distribution, :habitat, :diet, :breeding, :status
  @@all=[]
  def initialize 
     @@all<< self
  end
  
  def self.all
    @@all
  end
  
end
  