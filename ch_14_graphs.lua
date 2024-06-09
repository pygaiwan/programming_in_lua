local function name2node(graph, name)
    local node = graph[name]
    if not node then
        node = { name = name, adj = {} }
        graph[name] = node
    end
    return node
end

function read_graph()
    local graph = {}
    for line in io.lines() do
        local namefrom, nameto = string.match(line, '(%S+)%s+(%S+)')
        local from = name2node(graph, namefrom)
        local to = name2node(graph, nameto)

        from.adj[to] = true
    end
    return graph
end

function find_path (curr, to, path, visited)
    path = path or {}
    visited = visited or {}
    if visited[curr] then
        return nil
    end

    visited[curr] = true
    path[#path + 1] = curr
    if curr == to then
        return path
    end

    for node in pairs(curr.adj) do
        local p = find_path(node, to, path, visited)
        if p then return p end
    end
    table.remove(path)
end


graph = read_graph()

for value in pairs(graph) do
    io.write(graph[value].name .. ' -->\n')
    for a in pairs(graph[value].adj) do
        io.write('\t' .. a.name .. '\n')
    end
    io.write('\n')
end

path = find_path(graph['g1'], graph['g5'])
for i = 1, #path do
    print(path[i].name)
end
