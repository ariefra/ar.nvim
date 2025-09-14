# lazy.vim plugin spec for companion ai, with default config rewritten for easy modificatin.{{INSERTED_CODE}}

return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  config = function()
    require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = true },
        panel = { enabled = false },
        filetypes = {
            -- Uses default keymaps
            ["*"] = true,
            -- disable copilot on specific filetypes
            markdown = false,
            help = false,
            text = false,
        },
    })
  end
}