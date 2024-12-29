vim.api.nvim_create_user_command("SendCommand", function()
	require("sentmux").send_command(vim.fn.getline("."))
end, {})
