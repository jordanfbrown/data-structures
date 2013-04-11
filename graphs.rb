$graph = {
	a: [:b, :c],
	b: [:j, :a],
	c: [:a, :d, :j],
	d: [:c, :d, :e],
	e: [:d],
	f: [:g],
	g: [:f],
	j: [:b, :c, :d]
}

def connected?(start_node, end_node)
	explored = {}
	unexplored = [start_node]

	while unexplored.length > 0
		current_node = unexplored.shift
		explored[current_node] = true
		edge_nodes = $graph[current_node]

		if edge_nodes.include?(end_node)
			return true
		else
			unexplored = unexplored.concat(edge_nodes.select { |n| !explored[n] }).uniq
		end
	end

	false
end

def connected_r?(start_node, end_node, visited = {})
	edge_nodes = $graph[start_node]
	visited[start_node] = true

	if start_node == end_node
		true
	else
		edge_nodes.select! { |n| !visited[n] }
		edge_nodes.length > 0 ? edge_nodes.any? { |node| connected_r?(node, end_node, visited) } : false
	end
end

def depth_first(start_node, visited = {})
	visited[start_node] = true
	$graph[start_node].each { |node| depth_first(node, visited) unless visited[node] }
	visited.keys
end

puts depth_first(:a).inspect
