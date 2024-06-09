---@param value string
---@return boolean
function ispalindrome(value) return value == value:reverse() end

---@param value string
---@return boolean
function ispalindrome_without_spaces(value)
    value = value:gsub('[%s%p]', ''):lower()
    return value == value:reverse()
end

print(ispalindrome(arg[1]))
print(ispalindrome_without_spaces(arg[1]))
