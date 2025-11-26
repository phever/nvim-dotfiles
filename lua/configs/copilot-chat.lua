local user = vim.env.USER or "User"
user = user:sub(1, 1):upper() .. user:sub(2)
return {
  model = "gemini-3-pro-preview",
  temperature = "0.1",
  auto_insert_mode = false,
  question_header = "  " .. user .. " ",
  answer_header = "  Copilot ",
  window = {
    width = 0.4,
    layout = "horizontal",
  },
}
