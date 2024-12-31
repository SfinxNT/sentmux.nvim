local M = {}

M.send_command = function(command_to_sent)
	local ok, marked_pane =
		pcall(vim.fn.system, { "tmux", "list-panes", "-F", "#{pane_id}", "-f", "#{pane_marked}", "-a" })

	if not ok then
		vim.notify_once(marked_pane, vim.log.levels.ERROR)
		return
	end

	marked_pane = vim.fn.trim(marked_pane)

	if marked_pane == "" then
		vim.notify("No marked panes found", vim.log.levels.INFO)
		return
	end

	local command = "tmux send-keys -t "
		.. marked_pane
		.. " C-e C-u "
		.. vim.fn.shellescape(command_to_sent)
		.. " Enter"
	vim.fn.system(command)
end

return M
