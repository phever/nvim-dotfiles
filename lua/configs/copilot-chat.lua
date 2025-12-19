local user = vim.env.USER or "User"
user = user:sub(1, 1):upper() .. user:sub(2)
return {
  model = "claude-haiku-4.5",
  temperature = 0.1,
  auto_insert_mode = true,
  window = {
    layout = "float",
    width = 0.8,
  },
  headers = {
    user = " " .. user .. " ",
    assistant = "  Copilot ",
    tool = " Tool ",
  },
}
