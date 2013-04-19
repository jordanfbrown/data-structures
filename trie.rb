class Trie
  def initialize
    @root = Hash.new
  end

  def build(str)
    node = @root
    str.each_char do |ch|
      node[ch] ||= Hash.new
      node = node[ch]
    end
    node[:end] = true
  end
end

t = Trie.new
%w()



puts t.inspect