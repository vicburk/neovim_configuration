-- utils/colorspace.lua
local M = {}

-- Detect terminal color capability
function M.detect()
  local color_env = os.getenv("TERM")
  if not color_env then
    return 8
  end

  if color_env:match("256") then
    return 256
  elseif color_env:match("truecolor") or color_env:match("direct") then
    return 16777216
  else
    return 8
  end
end

return M
