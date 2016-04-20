Given(/^I am on the (.*)$/) do |page|

  case page
    when 'BBC homepage'
      puts "I'm on the BBC homepage!"
      bbc_site.visit
    when 'Exxon example page'
      puts "I'm on the Exxon example page!"
      exxon_site.visit
  end

end

When(/^I click on the Sign in button on the top of the page$/) do
  #pending
end

Then(/^I should arrive to the (.*) page$/) do |page|
  case page
    when 'sign in'
      puts "im in the BBC sign in page!"
    when 'exxon example'
      #expect(exxon_site.page_url).to match(/10.50.6.108/)
      expect(exxon_site.page_url).to match(/192.168.1.3/)#(/10.40.171.156/)
      puts "I'm in the exxon example page!"
  end
end

And(/^I should get the '(.*)' responses$/) do |response_type|
  response = RestClient.get(exxon_site.page_url)
  page = Nokogiri::HTML(open(exxon_site.page_url))
  case response_type
    when /sign in/
      expect(response.code).to eq(200)
      puts "Im the sign in response!"
    when /css/
      #aFile = File.new("./response_output","w+")
      #aFile.syswrite(response)

      page.css('link[type="text/css"]').each do |links|
        puts "links = #{links['href']}"
        response_link = RestClient.get(exxon_site.page_url << links['href'])
        expect(response_link.code).to eq(200)
      end

    when /js/
      js_link_array = []
      page.css('script[type="text/javascript"]').each do |links|
        #puts "links = #{links['src']}"
        js_link_array.push(links['src']) if links['src'] != nil
      end

      js_link_array.each do |b|
        #puts "array link = #{b}"
        response_link = RestClient.get(exxon_site.page_url << b)
        expect(response_link.code).to eq(200)
      end

    when /image/
      exxon_site.list_site_data('img')
  end
end