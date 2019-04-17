require 'open-uri'
class CLIProject::Scraper
  
  def getNames
    link="https://www.aviary.org"
    html=open(link+"/alphabetical")
    doc = Nokogiri::HTML(html)
    
    doc.css("tr td.commonNameCell a").each do |item|
      instan=CLIProject::Aviary.new
      instan.name=item.text
      instan.url=link+item.attr("href")
      html1=open(instan.url)
      doc1 = Nokogiri::HTML(html1)
      instan.distribution=doc1.css("div.rightCol p").first.text
    
    end
  end
  
  def getData(url)
    
  end
  
end

##<CLIProject::Aviary:0x0000000001c49838 @name="African Pygmy-goose", @url="https://www.aviary.org/animals/African-Pygmy-goose">