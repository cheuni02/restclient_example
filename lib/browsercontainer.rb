class BrowserContainer
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto ENV['HOST']
  end

end
