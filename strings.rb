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
  len = string.length
  string.each_char.with_index { |ch, i| total += 10 ** (len - i - 1) * (ch.ord - 48) }
  total
end

# "1" -> "11" this can be thought of as there is one one.
# "11" -> "21" there are two ones
# "21" -> "1211" there is one two and one one
# "1211" -> "111221" ect. there is one one, one two and two ones
def string_to_oral(string)
  current_count = 1
  last_char = string[0]
  string[1..string.length - 1].each_char.with_index do |ch, i|
    if ch == last_char
      current_count += 1
    else
      print current_count.to_s + last_char
      current_count = 1
      last_char = ch
    end

    if string.length == i + 2
      print current_count.to_s + ch + "\n"
    end
  end
end

def num_inputs(string)

end



string_to_oral("144144144")
