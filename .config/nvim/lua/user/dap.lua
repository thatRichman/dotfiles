local M = {
  "mfussenegger/nvim-dap",
  commit = "6b12294a57001d994022df8acbe2ef7327d30587",
  event = "VeryLazy",
}

function M.config()
  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  --
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dapui.close()
  -- end
  --
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dapui.close()
  -- end

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }
  dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-dap",
    name = "lldb"
  }
  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }
dap.configurations.rust = {
	{
		name = "LLDB-dap: Launch",
		type = "lldb",
		request = "launch",
		program = function()
			local output = vim.fn.systemlist("cargo build -q --message-format=json 2>1")
			for _, l in ipairs(output) do
				local json = vim.json.decode(l)
				if json == nil then
					error("error parsing json")
				end
				if json.success == false then
					return error("error building package")
				end
				if json.executable ~= nil then
					return json.executable
				end
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
    args = {},
    runInTerminal = false,
	},
	{
		name = "LLDB-dap: Launch with Arguments",
		type = "lldb",
		request = "launch",
		program = function()
			local output = vim.fn.systemlist("cargo build -q --message-format=json 2>1")
			for _, l in ipairs(output) do
				local json = vim.json.decode(l)
				if json == nil then
					error("error parsing json")
				end
				if json.success == false then
					return error("error building package")
				end
				if json.executable ~= nil then
					return json.executable
				end
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function ()
		  local args_string = vim.fn.input("cmdline args: ")
      return vim.split(args_string, " ")
		end,
    runInTerminal = false,
	},
}
  dap.configurations.env = function()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
      table.insert(variables, string.format("%s=%s", k, v))
    end
    return variables
  end
end


return M
