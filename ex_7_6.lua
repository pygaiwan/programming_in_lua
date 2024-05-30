-- create a new directory in UNIX based system
---@param dirname string
---@return boolean? 'true if folder has been created'
function create_dir(dirname)
    local success, _, signal = os.execute(string.format('mkdir %s', dirname))
    if success then return success else
        error(string.format('Something went wrong with the create_dir function. Error code %d', signal))
    end
end

-- remove a directory in UNIX based system
---@param dirname string
---@return boolean? 'true if folder has been removed'
function remove_dir(dirname)
    local success, _, signal = os.execute(string.format('rm -r %s', dirname))
    if success then return success else
        error(string.format('Something went wrong with the remove_dir§ function. Error code %d', signal))
    end
end

-- print the content of a directory in a UNIX based system
---@param dirname string
function list_files(dirname)
    local res = io.popen(string.format("ls -l %s", dirname), 'r')
    if res then print(res:read("a")) else error("Something went wrong with the list_files function.") end
end

-- This is for exercise 7.7, showing change directory is not working as expected.
---@param dirname string
function change_dir(dirname)
    print('Current path before `cd` is: ')
    os.execute('pwd')
    
    local res = os.execute(string.format('cd %s', dirname))
    if not res then error('Error executing change_dir') end

    print(string.format('\nChange dir finished with %s however the current path is', res))
    os.execute('pwd')
    print('\nYou cant change path since Lua create a subshell when executing the command, not taking effect on the next commands.')
    print('The same can be seen when creating env variables using the os.execute functionality:\n')

    local export_res = os.execute('export EXAMPLE=1')
    print('Executing `export EXAMPLE=1`. Finished with status ', export_res)

    local echo = io.popen('echo ${EXAMPLE}', 'r')
    
    print('Executing `echo ${EXAMPLE}`, expecting 1, got: ', echo:read('a'))
    
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
elseif arg[1] == 'changedir' then
    change_dir(arg[2])
else
    error('available commands are "create", "remove", "list"')    
end