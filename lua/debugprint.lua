-- luacheck: globals vim

local sub = vim.fn.substitute

local M = {}

local commandpreset_for_language = {
	bash = "echo \"{{var}}: ${{var}}\"",
	java = "System.out.println(\"{{var}}: \" + {{var}});",
	javascript = "console.log(\"{{var}}:\", {{var}});",
	lua = "print(\"{{var}}:\", {{var}})",
	nu = "print $\"{{var}}: (${{var}})\"",
	python = "print(\"{{var}}:\", __import__(\"pprint\").pformat({{var}}))",
	rust = "dbg!({{var}});",
	sh = "echo \"{{var}}: ${{var}}\"",
	typescript = "console.log(\"{{var}}:\", {{var}});",
}

function M.print()
	local pos = vim.fn.getpos(".")
	local var = vim.fn.expand("<cexpr>")
	local preset = commandpreset_for_language[vim.bo.filetype]
	local command = sub(preset, "{{var}}", var, "g")
	vim.api.nvim_buf_set_lines(0, pos[1]+2, pos[1]+2, false, {command})
	vim.fn.setpos(".", pos)
end

function M.setup()
	vim.api.nvim_create_user_command(
		"Debugprint",
		M.print,
		{desc = "add a debug-print for the variable below the cursor"}
	)
end

return M
