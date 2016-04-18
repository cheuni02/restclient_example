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

end
