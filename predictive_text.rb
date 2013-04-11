class TextPredictor
  def initialize(words)
    @character_map = {
      0 => [],
      1 => [],
      2 => %w(a b c),
      3 => %w(d e f),
      4 => %w(g h i),
      5 => %w(j k l),
      6 => %w(m n o),
      7 => %w(p q r s),
      8 => %w(t u v),
      9 => %w(w x y z),
    }
    @root = Hash.new
    build_words(words)
  end

  def build_words(words)
    words.each { |word| build(word) }
  end

  def build(str)
    node = @root
    str.each_char do |ch|
      node[ch] ||= Hash.new
      node = node[ch]
    end
    node[:end] = str
  end

  def find(str)
    node = @root
    str.each_char do |ch|
      return nil unless node = node[ch]
    end
    !node[:end].nil?
  end

  def get_leaves(node = @root)
    leaves = []
    unexplored = [node]

    until unexplored.length == 0
      node = unexplored.shift
      leaves << node[:end] if node[:end]
      unexplored.concat(node.select { |k, v| k != :end }.values)
    end

    leaves
  end

  def predictive_text(numbers)
    next_nodes = [@root]

    numbers.each do |current_number|
      next_nodes = next_nodes.map do |next_node|
        @character_map[current_number].select { |ch| next_node[ch] }.map { |ch| next_node[ch] }
      end.flatten
    end

    next_nodes.map { |n| get_leaves(n) }.flatten
  end

  def find_matches(string)
    node = @root
    string.each_char do |ch|
      node = node[ch] || nil
      break if node.nil?
    end
    node ? get_leaves(node) : nil
  end
end

words = File.read('/usr/share/dict/words/').split(/\n/)
t = TextPredictor.new(words)

puts t.predictive_text([9, 8, 2, 2]).inspect
puts t.predictive_text([4, 5, 2, 4]).inspect
puts t.predictive_text([7, 8, 4, 4]).inspect