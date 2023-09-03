#!/usr/bin/lua

function runcmd(cmd)
	local command = io.popen(cmd)
	local cout = command:read("*a")
	local exitcode = command:close()
	local out = {cout, exitcode}
	return out
end

function getroot()
	local exit = runcmd("whoami")
	local username = exit[1]:gsub("%s+", "")
	if username == "root" then 
		print("My king, I am at your service.")
	else
		print("When root perms?")
		os.exit(13)
	end
end

getroot()
