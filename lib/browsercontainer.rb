class BrowserContainer
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto ENV['HOST']
  end

  def page_url
    @browser.url
  end

  def site_data_links
    @browser.links
  end

  def list_site_data(datatype)
    #images = []
    #open folder
    @browser.goto ("#{ENV['HOST']}/#{datatype}/")

    #scrape links to array
    site_data_links.each do |link|
     #puts link.href.gsub(/http:\/\/192.168.88.105:8000\/#{datatype}/,'<matched here>')
     puts link.href.gsub(/[a-z]+:\/\/\d+.\d+.\d+.\d+:\d+\/#{datatype}/,'')
    end
    #return images
  end

end
