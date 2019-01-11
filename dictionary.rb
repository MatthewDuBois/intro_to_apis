# Exercise: Build a terminal dictionary app

# • Add to this ruby file called dictionary_app.rb

# • The program should ask the user to enter a word, then use the wordnik API to show the word’s definition, top example, and pronunciation: http://developer.wordnik.com/docs.html#!/word

# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.

require 'http'

system "clear"

puts "Welcome to the Dictionary App"
puts ""

print "Enter a word: "
input_word = gets.chomp

puts ""

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ input_word }/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
definitions = response.parse

response_one = HTTP.get("https://api.wordnik.com/v4/word.json/#{ input_word }/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
pronunciations = response_one.parse

response_three = HTTP.get("https://api.wordnik.com/v4/word.json/#{ input_word }/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
top_example = response_three.parse



list_number = 1

definitions.each do |definition|
  puts "#{list_number} - #{definition["text"]}"
  puts ""
  list_number += 1
end

puts "Top Example"
puts "#{top_example["text"]}"
puts ""
puts "Pronunciations"

pronunciations.each do |pronunciation|
  puts "  • #{pronunciations}"
end