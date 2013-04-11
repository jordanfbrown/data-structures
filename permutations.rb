# a b c
# a c b
# b a c
# b c a
# c a b
# c b a

# a b
# b a

def permute(string, i)
	len = string.length - 1
	puts "here, #{string}, #{i}, #{len}"
	if i == len
		puts string
	else
		(i..len).each do |j|
			string[i], string[j] = string[j], string[i]
			permute(string, i + 1)
			string[j], string[i] = string[i], string[j]
		end
	end
end

permute('ab', 0)