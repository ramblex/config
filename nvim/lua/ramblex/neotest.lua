require('dap').adapters.ruby = function(callback, config)
  print(config.command)
  print(config.args)
  local args = vim.tbl_flatten({
    "run", "-e", "RAILS_ENV=test", "--rm", "bundle", "exec", config.command, config.args
  })

  --table.insert(args, config.args)

  callback {
    type = "executable",
    command = "docker",
    args = args,
  }
end

require("neotest").setup({
  adapters = {
    require("neotest-rspec")()
  },
})
