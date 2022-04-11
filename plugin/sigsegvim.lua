vim.api.nvim_create_user_command("Sigsegv", function()
  require("ffi").new "int(*)()"()
end, {})
