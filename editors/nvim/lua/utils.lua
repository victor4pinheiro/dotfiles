local M = {} -- Module table

M.set_keymap = function(mode, lhs, rhs, opts)
  opts = opts or { silent = true, noremap = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
