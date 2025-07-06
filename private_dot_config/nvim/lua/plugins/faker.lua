-- https://github.com/tehdb/nvim-faker
-- https://github.com/tehdb/faker-cli
-- https://fakerjs.dev/api/

return {
  'tehdb/nvim-faker',
  config = function()
    require('nvim-faker').setup({
      use_global_package = true -- use gloabl npm package otherwise npx (default: false)
    })
  end
}
