class Node
  attr_reader :value, :key

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class LRUCache
  def initialize()
    @hash = {}
    @queue = []
    read_input
  end

  def bound(bound)
    bound = bound.to_i
    # If bound changes such that new bound is smaller, remove the last n nodes, where n is the difference between the old size bound and the new bound
    if @bound && bound < @bound
      @queue[bound..@queue.length - 1].each do |node|
         @hash.delete(node.key)
         @queue.delete(node)
      end
    end    
    @bound = bound
  end

  def set(key, value)
    # Remove oldest node if we're over bound
    if @queue.size >= @bound
      node = @queue.shift
      @hash.delete(node.key)
    end

    # If key already exists, remove the old node with that key
    if @hash.has_key? key
      node = @hash[key]
      @queue.delete(node)
    end

    # Add new node to front of queue, store reference in hash
    node = Node.new(key, value)
    @queue << node
    @hash[key] = node
  end

  def get(key)
    # If hash has key, move node from wherever it is to the front of the queue
    if @hash.has_key? key
      node = @hash[key]
      @queue.delete(node)
      @queue << node
      puts node.value
    else
      puts 'NULL'
    end 
  end

  def peek(key)
    if @hash.has_key? key
      puts @hash[key].value
    else
      puts 'NULL'
    end
  end

  def dump
    @hash.sort.each { |key, node| puts "#{key} #{node.value}" }
  end

  def read_input
    commands = ARGF.read.split(/\n/)
    num_commands = commands.shift.to_i
    commands.each do |command|
      split_command = command.split(' ')
      method = split_command.shift.downcase
      self.send(method, *split_command)
    end
  end
end

cache = LRUCache.new

