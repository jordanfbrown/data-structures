# Find the first non-repeat character in a string

def find_char(string)
	char_hash = Hash.new(0)
	chars = string.split('')
	chars.each do |char|
		char_hash[char] += 1
	end
	chars.each do |char|
		return char if char_hash[char] == 1
	end
	nil
end

# Remove chars from a string
def remove_chars_regex(string, remove)
	string.gsub(/[#{remove}]/, '')
end

def remove_chars(string, remove)
	new_string = ''
	remove_array = remove.split('')
	string.split('').each do |char|
		new_string += char unless remove_array.include? char
	end
	new_string
end

def reverse_words(string)
	string.split(' ').reverse.join(' ')
end

def str_to_int(string)
	total = 0
	negative = string[0] == '-'
	length = negative ? string.length - 1 : string.length
	string[1..string.length-1].split('').each_with_index do |char|
		total *= 10
		total += char  
	end
	total
end

puts str_to_int("-305")


