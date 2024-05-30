-- create a new directory in UNIX based system
---@param dirname string
---@return boolean? 'true if folder has been created'
function create_dir(dirname)
    local success, _, signal = os.execute(string.format('mkdir %s', dirname))
    if success then return success else
        error(string.format('Something went wrong with the create_dir funciton. Error code %d', signal))
    end
end

-- remove a directory in UNIX based system
---@param dirname string
---@return boolean? 'true if folder has been removed'
function remove_dir(dirname)
    local success, _, signal = os.execute(string.format('rm -r %s', dirname))
    if success then return success else
        error(string.format('Something went wrong with the remove_dir§ funciton. Error code %d', signal))
    end
end

-- print the content of a directory in a UNIX based system
---@param dirname string
function list_files(dirname)
    local res = io.popen(string.format("ls -l %s", dirname), 'r')
    if res then print(res:read("a")) else error("Something went wrong with the list_files funciton.") end
end



if not arg[1] then
    error('Operation has to be provided. Available commands are "create", "remove", "list"')
end

if arg[1] == 'create' then
    create_dir(arg[2])    
elseif arg[1] == 'remove' then
    remove_dir(arg[2])
elseif arg[1] == 'list' then
    list_files(arg[2])
else
    error('available commands are "create", "remove", "list"')    
end


