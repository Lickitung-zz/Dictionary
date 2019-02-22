# get API data
# sort through API data
# ask user to enter a word
# create print statement that shows definition of user input
require 'http'

loop do 
  p "Type a word for the definition:"
  user_word = gets.chomp
  if user_word == "q"
    break
  else

  end
  puts "-----------------------------------------------------------------------------------------------------"

  response_definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=______")

  response_pronounciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_word}/pronunciations?useCanonical=false&limit=50&api_key=______")


  word_definition = response_definition.parse
  word_pronounciation = response_pronounciation.parse

  puts "The definitiion of '#{user_word}' is:"
  p word_definition[0]["text"]

  puts "-----------------------------------------------------------------------------------------------------"

  puts "The pronounciation for '#{user_word}' is:"
  p word_pronounciation[0]["raw"]
end