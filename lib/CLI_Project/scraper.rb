require 'open-uri'
class CLIProject::Scraper
  
  def getNames
    link="https://www.aviary.org"
    html=open(link+"/alphabetical")
    doc = Nokogiri::HTML(html)
    
    doc.css("tr td.commonNameCell a").each do |item|
      counter=1
      instan=CLIProject::Aviary.new
      instan.name=item.text
      instan.url=link+item.attr("href")
      # html1=open(instan.url)
      # doc1 = Nokogiri::HTML(html1)
      # instan.distribution=doc1.css("div.rightCol p").first.text
      # instan.habitat=doc1.css("div.rightCol p")[1].text
      # instan.diet=doc1.css("div.rightCol p")[2].text
      # instan.breeding=doc1.css("div.rightCol p")[3].text
      # instan.status=doc1.css("div.rightCol p")[4].text
      # instan.funFact=doc1.css("div.funFact").text.gsub("FUN FACT","").strip
      # instan.description=doc1.css("div.centerContent p").text
      # # binding.pry
    end
  end
   
  # def getDistribution(url)
  #   instan=CLIProject::Aviary.new
  #   html1=open(url)
  #     doc1 = Nokogiri::HTML(html1)
  #     instan.distribution=doc1.css("div.rightCol p").first.text
  # end
  
  
end

##<CLIProject::Aviary:0x0000000001c49838 @name="African Pygmy-goose", @url="https://www.aviary.org/animals/African-Pygmy-goose">