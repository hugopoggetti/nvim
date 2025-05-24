return {
  "windwp/nvim-autopairs",
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    npairs.setup({
      map_cr = false,
    })
    -- npairs.add_rule(Rule("<", ">"))
  end,
}
