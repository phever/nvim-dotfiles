require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
-- { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
-- {
--   "<leader>aa",
--   desc = "Toggle (CopilotChat)",
--   mode = { "n", "v" },
-- },
-- {
--   "<leader>ax",
--   function()
--     return require("CopilotChat").reset()
--   end,
--   desc = "Clear (CopilotChat)",
--   mode = { "n", "v" },
-- },
-- {
--   "<leader>aq",
--   function()
--     vim.ui.input({
--       prompt = "Quick Chat: ",
--     }, function(input)
--       if input ~= "" then
--         require("CopilotChat").ask(input)
--       end
--     end)
--   end,
--   desc = "Quick Chat (CopilotChat)",
--   mode = { "n", "v" },
-- },
-- {
--   "<leader>ap",
--   function()
--     require("CopilotChat").select_prompt()
--   end,
--   desc = "Prompt Actions (CopilotChat)",
--   mode = { "n", "v" },
-- },
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
