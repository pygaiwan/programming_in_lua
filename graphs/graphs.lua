local Graph = {}

function Graph.new()
    return {vertices = {}, edges = {}}
end

function Graph.add_vertex(graph, vertex)
    graph.vertices[vertex] = true
    graph.edges[vertex] = graph.edges[vertex] or {}
end

function Graph.add_edge(graph, v1, v2)
    graph.edges[v1][v2] = true
    graph.edges[v2][v1] = true
end

function Graph.get_adjacent_vertices(graph, vertex)
    local adjacent = {}
    for v in pairs(graph.edges[vertex]) do
        table.insert(adjacent, v)
    end

    return adjacent
end

local g = Graph.new()
Graph.add_vertex(g, 'A')
Graph.add_vertex(g, 'B')
Graph.add_vertex(g, 'C')
Graph.add_vertex(g, 'D')

Graph.add_edge(g, 'A', 'B')
Graph.add_edge(g, 'A', 'C')
Graph.add_edge(g, 'B', 'D')
Graph.add_edge(g, 'B', 'C')

local adj_to_A = Graph.get_adjacent_vertices(g, 'A')
local adj_to_B = Graph.get_adjacent_vertices(g, 'B')
print('Vertices adjacent to A:', table.concat(adj_to_A, ', '))
print('Vertices adjacent to B:', table.concat(adj_to_B, ', '))
