return {
  "NickvanDyke/opencode.nvim",
  lazy = false,
  dependencies = {
    -- Required for the `snacks` terminal and picker provider
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    local opencode_cmd = "opencode --port"
    local snacks_terminal_opts = {
      win = {
        position = "right",
        enter = false,
      },
    }

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      auto_reload = true,
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
        end,
      },
    }

    local opencode = require("opencode")
    vim.o.autoread = true

    local function ask_agent(agent, prompt)
      opencode.ask("@" .. agent .. " " .. (prompt or ""), { submit = false })
    end

    -- Toggle and general interactions
    vim.keymap.set({ "n", "t" }, "<leader>oo", function()
      require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
    end, { desc = "Toggle opencode" })
    vim.keymap.set({ "n", "v" }, "<leader>oa", function() opencode.ask("@this: ", { submit = false }) end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "v" }, "<leader>om", function() opencode.select() end, { desc = "Execute opencode action…" })
    
    -- Specific Agent Mappings
    -- vim.keymap.set({ "n", "v" }, "<leader>of", function() ask_agent("fast") end, { desc = "OpenCode Fast (Groq)" })
    -- vim.keymap.set({ "n", "v" }, "<leader>oA", function() ask_agent("architect") end, { desc = "OpenCode Architect (Claude)" })
    -- vim.keymap.set({ "n", "v" }, "<leader>od", function() ask_agent("debugger") end, { desc = "OpenCode Debugger (Gemini)" })
    -- vim.keymap.set({ "n", "v" }, "<leader>oc", function() ask_agent("coder") end, { desc = "OpenCode Coder (GPT)" })
    
    -- Context additions
    vim.keymap.set({ "n", "v" }, "<leader>o+", function() opencode.prompt("@this") end, { desc = "OpenCode add context" })
    vim.keymap.set({ "n", "x" }, "ga", function() opencode.prompt("@this") end, { desc = "Add to opencode" })
    
    -- Scrolling the chat
    vim.keymap.set("n", "<S-C-u>", function() opencode.command("session.half.page.up") end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function() opencode.command("session.half.page.down") end, { desc = "opencode half page down" })
    
    -- Remaps to free up standard Vim increment/decrement
    vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
    vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
  end,
}
