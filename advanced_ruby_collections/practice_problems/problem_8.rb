hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = 'aeiouAeiou'
vowels_from_strings = ''

hsh.each do |_, values|
  values.each do |string|
    string.chars.each do |char|
      vowels_from_strings += char if vowels.include?(char)
    end
  end
end

p vowels_from_strings
   
    

