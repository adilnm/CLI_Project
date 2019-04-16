require 'open-uri'
class CLIProject::Scraper
  
  def getNames
    link="https://www.aviary.org"
    html=open(link+"/alphabetical")
    doc = Nokogiri::HTML(html)
    
    doc.css("tr td.commonNameCell a").each do |name|
      CLIProject::Aviary.new.name=name.text
    end

  end
  
end