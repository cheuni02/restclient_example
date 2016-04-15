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
      puts "I'm in the exxon example page!"
  end
end

And(/^I should get the '(.*)' responses$/) do |response_type|
  case response_type
    when /sign in/
      puts "Im the sign in response!"
    when /ccs/
    when /js/
  end
end