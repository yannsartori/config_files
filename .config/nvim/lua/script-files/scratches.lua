local api = vim.api
local M = {
	_state = {
		last_floating_window = nil,
	},
}

function M.get_scratch_filename()
	return ".scratches/notes.md"
end

function M.open_scratch_file_floating(opts)
	if M._state.last_floating_window ~= nil then
		api.nvim_win_close(M._state.last_floating_window, false)
		M._state.last_floating_window = nil
	end

	opts = vim.tbl_deep_extend("force", { percentWidth = 0.8, percentHeight = 0.8 }, opts or {})

	local ui = vim.api.nvim_list_uis()[1]

	local width = math.floor(ui.width * opts.percentWidth)
	local height = math.floor(ui.height * opts.percentHeight)

	-- Create the floating window
	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		col = (ui.width / 2) - (width / 2),
		row = (ui.height / 2) - (height / 2),
		anchor = "NW",
		border = "rounded",
	}
	local winr = api.nvim_open_win(0, true, win_opts)
	M._state.last_floating_window = winr

	api.nvim_command("edit " .. M.get_scratch_filename())

	local bufnr = api.nvim_get_current_buf()

	local closing_keys = { "q", "<esc>" }

	for _, key in ipairs(closing_keys) do
		vim.keymap.set({ "n" }, key, function()
			api.nvim_command(":silent !mkdir -p .scratches")
			api.nvim_command(":w")
			api.nvim_win_close(0, false)
			M._state.last_floating_window = nil
		end, { buffer = bufnr })
	end
end
api.nvim_create_user_command("ScratchOpenFloat", M.open_scratch_file_floating, {})

return M
