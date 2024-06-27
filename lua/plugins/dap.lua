require("dapui").setup()

-- local dap, dapui = require("dap"), require("dapui")
local dap = require("dap")
local dapui = require("dapui")


-- ========= Debug Adapter =============

-- vscode-cpptools
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = 'C:/Users/inTree/.vscode/extensions/ms-vscode.cpptools-1.20.5-win32-x64/debugAdapters/bin/OpenDebugAD7.exe',
  options = {
    detached = false
  }
}

-- gdb (Native)
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}


-- =========== Configuration for Languages ==============

-- cpptools for C++.
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- gdb for C.
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

-- ========== DAP UI setup ===================

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
-- dap.float_element(scope)
