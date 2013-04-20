module BST

  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value)
      @value = value
    end
  end

  class Tree
    attr_reader :root, :size
  
    def initialize(root = nil)
      if root
        @root = root 
        @size = 1
      else
        @size = 0
      end
    end

    def to_s
      @root ? traverse(@root) : 'empty'
    end

    def traverse(node)
      puts node.value
      traverse(node.left) unless node.left.nil?
      traverse(node.right) unless node.right.nil?
    end

    def search(value, node = @root)
      if node.nil?
        puts 'Not found'
      elsif node.value == value
        puts 'Found!'
      elsif value < node.value
        search(value, node.left)
      else
        search(value, node.right)
      end
    end

    def is_valid?(node = @root, min = -Float::INFINITY, max = Float::INFINITY)
      left_valid = true
      right_valid = true

      current_valid = node.value > min && node.value < max

      if !node.left.nil?
        left_valid = is_valid?(node.left, min, node.value)
      end

      if !node.right.nil?
        right_valid = is_valid?(node.right, node.value, max)
      end

      current_valid && left_valid && right_valid
    end

    def add(value)
      if @root.nil?
        @size += 1
        @root = Node.new(value)
      else
        add_helper(@root, value)
      end
    end

    private

    def add_helper(node, value)
      if value < node.value
        if node.left.nil?
          @size += 1
          node.left = Node.new(value)
        else
          add_helper(node.left, value)
        end
      elsif value > node.value
        if node.right.nil?
          @size += 1
          node.right = Node.new(value)
        else
          add_helper(node.right, value)
        end
      end
    end

  end
end

tree = BST::Tree.new
tree.add(4)
tree.add(5)
tree.add(10)
tree.add(12)
tree.add(1)
tree.add(17)
tree.add(4)
tree.add(9)
tree.add(9)
tree.add(9)

puts tree.size
