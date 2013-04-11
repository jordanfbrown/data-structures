class LinkedList
	attr_accessor :head

	def insert(value)
		element = ListElement.new(value)
		element.next = @head
		@head = element
	end

	def inspect
		values = ''
		el = @head
		until el.nil?
			values += "#{el.value} "
			el = el.next
		end
		values
	end

	def head
		@head.value
	end

	def delete(value)
		el = @head

		if el.value == value
			@head = el.next 
			return
		end

		until el.next.value == value
			el = el.next
		end
		el.next = el.next.next
	end

	def tail
		el = @head
		while true
			el = el.next
			return el.value if el.next.nil?
		end
	end
end

class ListElement
	attr_accessor :value, :next

	def initialize(value)
		@value = value			
	end	
end

class Stack < LinkedList
	def pop
		unless @head.nil?
			el = @head
			@head = el.next
			el
		end
	end
end

stack = Stack.new
stack.insert(3)
stack.insert(4)
stack.insert(5)
stack.insert(6)
stack.insert(7)
stack.insert(8)
stack.insert(9)

puts stack.inspect
puts stack.pop.value
puts stack.pop.value
puts stack.inspect

