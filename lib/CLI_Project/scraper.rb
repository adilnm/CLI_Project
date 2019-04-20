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

    end
  end
end
