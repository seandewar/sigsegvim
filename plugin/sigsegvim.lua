vim.api.nvim_add_user_command("Sigsegv", function()
  require("ffi").new "int(*)()"()
end, {})
