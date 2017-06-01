# <Alphabet> program.
# This program fills the hash with vowels, where the value is the alphabetic order number of the letter.

vowels = 'aeiou'
letters = ('a'..'z')
hash = {}

letters.each_with_index { |letter, index| hash[letter] = index + 1 if vowels.include?(letter) }

puts hash
