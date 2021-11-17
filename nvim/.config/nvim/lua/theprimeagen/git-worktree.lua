local Worktree = require("git-worktree")


local M = {}
function M.execute(path, just_build)
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[upstream]])
    M.execute(path.path)
end)

return M
