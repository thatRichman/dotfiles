local M = {
  "danymat/neogen",
  config = true,
  enable = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}

function M.config()
  require "neogen".setup() {}
end

return M
