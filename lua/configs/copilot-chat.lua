local user = vim.env.USER or "User"
user = user:sub(1, 1):upper() .. user:sub(2)
return {
  model = "claude-sonnet-4",
  temperature = "0.1",
  -- auto_insert_mode = true,
  question_header = "  " .. user .. " ",
  answer_header = "  Copilot ",
  window = {
    width = 0.4,
    layout = "horizontal",
  },
}
