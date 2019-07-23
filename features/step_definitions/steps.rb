When("send request {string} whith parameter {string}") do |request, parameter|
  @response = request_content(request, parameter)
  request_debug_url #print url
end

Then("response {string} should be returned") do |responseCode|
  response_code(responseCode)
end

Then("the result should be error {string}") do |expectedTerm|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response["error"]).to eq(expectedTerm.to_s)
end

Then("the result should be {string}") do |expectedTerm|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response["result"]).to eq(expectedTerm.to_s)
end

Then("the result should contain {string}") do |expectedTerm|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response.to_s).to eq(expectedTerm)
end