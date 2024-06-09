local function name2node(graph, name)
    local node = graph[name]
    if not node then
        node = {node_name = name, adj = {}}
        graph[name] = node
    end
    return node
end

function read_graph()
    local graph = {}
    for line in io.lines() do
        local namefrom, nameto, arcname = string.match(line, '(%S+)%s+(%S+)%s+(%S+)')
        local from = name2node(graph, namefrom)
        local to = name2node(graph, nameto)
        from.adj[to] = {arcname = arcname, pointed_node = to.node_name}
    end
    return graph
end

function find_path(curr, to, path, visited)
    path = path or {}
    visited = visited or {}
    if visited[curr] then return nil end

    visited[curr] = true
    path[#path + 1] = curr
    if curr == to then return path end

    for node in pairs(curr.adj) do
        local p = find_path(node, to, path, visited)
        if p then return p end
    end
    table.remove(path)
end

local graph = read_graph()

local path = find_path(graph['g1'], graph['g5'])
if path then
    local path_node = path[1].node_name
    for i = 2, #path do
        for _, arc in pairs(graph[path_node].adj) do
            if arc.pointed_node == path[i].node_name then
                io.write(string.format('Going from %s to %s via %s\n', path_node, arc.pointed_node,
                    arc.arcname))
            end
        end
        path_node = path[i].node_name
    end
end
