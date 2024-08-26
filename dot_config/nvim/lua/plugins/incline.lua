-- if true then return {} end

-- https://github.com/b0o/incline.nvim
-- lightweight floating statuslines

-- TODO: make it nicer and a bit more informative
return {
  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup()
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
}
