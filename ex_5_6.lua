---Verify if a table t is a sequence
---@param t table
---@return boolean
function is_valid_sequence(t)
    max_idx = 0
    for idx, _ in ipairs(t) do
        if type(idx) ~= "number" or idx % 1 ~= 0 or idx < 1 or t[idx] == nil then
            return false
        end
        max_idx = math.max(max_idx, idx)
    end
    return max_idx == #t 
end

print(is_valid_sequence({1, 2, 3.5, 4, 's', 7}))