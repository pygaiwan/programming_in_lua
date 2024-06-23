---Transliterate a given string based on the table provided. If a value of
-- a table is mapped as false, remove that char. Return a new string.
---@param s string
---@param t table
---@return string
function transliterate(s, t)
    local modified_s = s
    for k in pairs(t) do
        if t[k] ~= false then
            modified_s = modified_s:gsub(k, t[k])
        else
            modified_s = modified_s:gsub(k, '')
        end
    end
    return modified_s
end

local original = 'la bella lava il fosso.'
describe("Replace each char. All found.\n", function()
    local s = transliterate(original, { ['a'] = 'b', ['l'] = 'd', ['e'] = 'd' })
    it('Check length is the same as before', function() assert.is.equal(#s, #original) end)
    it('Check all are replaced', function() assert.is.equal(s, 'db bdddb dbvb id fosso.') end)
end)

describe("Replace some char. One not present.\n", function()
    local s = transliterate(original, { ['a'] = 'b', ['l'] = 'd', ['x'] = 'd' })
    it('Check length is the same as before', function() assert.is.equal(#s, #original) end)
    it('Check x not replaced', function() assert.is.equal(s, 'db beddb dbvb id fosso.') end)
end)

describe("Replace no char. None found.\n", function()
    local s = transliterate(original, { ['x'] = 'b', ['y'] = 'd', ['z'] = 'd' })
    it('Check length is the same as before', function() assert.is.equal(#s, #original) end)
    it('Check none replaced', function() assert.is.equal(s, original) end)
end)

describe("Replace some char. One is false.\n", function()
    local s = transliterate(original, { ['a'] = 'b', ['l'] = false, ['e'] = 'd' })
    it('Check all l removed', function() assert.is.equal(s, 'b bdb bvb i fosso.') end)
end)

describe("Remove all chars. All are false.\n", function()
    local s = transliterate(original, { ['a'] = false, ['l'] = false, ['e'] = false })
    it('Check all mapped char removed', function() assert.is.equal(s, ' b v i fosso.') end)
end)

describe("Remove all chars. Result in empty string.\n", function()
    local s = transliterate('aaaa', { ['a'] = false, ['l'] = false, ['e'] = false })
    it('Check all chars removed', function() assert.is.equal(s, '') end)
end)

describe("Original string not modified\n", function()
    local s = transliterate(original, { ['a'] = 'b', ['l'] = 'd', ['e'] = 'd' })
    it('Check original is same as before',
        function() assert.is.equal(original, 'la bella lava il fosso.') end)
end)
