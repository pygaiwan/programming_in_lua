--- replicate python str.split()
---@param s string
---@param delimiter string
---@return table
function split (s, delimiter)
    local i, j = 0, 0
    local t = {}
    while i do
        i, j  = s:find('[^'..delimiter..']+', i)
        if i then 
            table.insert(t, s:sub(i, j))
            i = j + 1
        end
    end
    return t
end

describe ("Test space separator on whole string.\n", function ()
    local t = split("a whole new world", " ")
    it ("Test correct length", function () assert.is.equal(#t, 4) end)
    it ("Test correct word 1", function() assert.is.equal(t[1], 'a') end)
    it ("Test correct word 2", function() assert.is.equal(t[2], 'whole') end)
    it ("Test correct word 3", function() assert.is.equal(t[3], 'new') end)
    it ("Test correct word 4", function() assert.is.equal(t[4], 'world') end)
end)

describe ("Test exclamation point in middle of string.\n", function ()
    local t = split("a whole !new world", "!")
    it ("Test correct length", function () assert.is.equal(#t, 2) end)
    it ("Test correct slice 1", function() assert.is.equal(t[1], 'a whole ') end)
    it ("Test correct slice 2", function() assert.is.equal(t[2], 'new world') end)
end)

describe ("Test missing separator on whole string.\n", function ()
    local t = split("a whole new world", "s")
    it ("Test correct length", function () assert.is.equal(#t, 1) end)
    it ("Test whole string returned", function() assert.is.equal(t[1], 'a whole new world') end)
end)

describe ("Test separator on empty string.\n", function ()
    local t = split("", "s")
    it ("Test correct length", function () assert.is.equal(#t, 0) end)
end)
