local function FAIL(msg)
  print(msg)
  vim.cmd('cq')
end

local uv = vim.loop

local handle
handle = uv.spawn('nvim', {
  stdio = { uv.new_pipe(), uv.new_pipe(), uv.new_pipe() },
  args = {'-u', 'test/init.vim'},
}, function(_, signal)
  vim.schedule(function()
    if signal ~= 11 then
      FAIL('expected signal 11, got '..signal)
    end

    print('ok')
    vim.cmd('qa!')
  end)
end)

if not handle then
  FAIL('could not spawn process')
end

vim.defer_fn(function()
  FAIL('timeout')
end, 2000)
