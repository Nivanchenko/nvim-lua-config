return {

  "nvim-treesitter/nvim-treesitter",
  "nvim-neotest/nvim-nio",
  "nvim-lua/plenary.nvim",
  "ldelossa/nvim-dap-projects",

  {"theHamsta/nvim-dap-virtual-text", config = function() require("nvim-dap-virtual-text").setup() end,},

  {"rcarriga/nvim-dap-ui", 
  -- config = function() require("dapui").setup() end,
  },

  {"mfussenegger/nvim-dap",
    config = function()

        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
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

        vim.keymap.set("n", "<F9>", ':DapToggleBreakpoint<CR>')
        vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
        vim.keymap.set("n", "<F5>", ':DapContinue<CR>')
        vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
        vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
        vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

        dap.adapters.bsl = {
          id = 'oscript';
          type = 'executable';
          command = 'mono'; 
          args = {"/home/nick/.vscode/extensions/evilbeaver.oscript-debug-0.9.1/bin/VSCode.DebugAdapter.exe"};
          name = 'bsl';
        }

        dap.configurations.bsl = {
          {
            type = 'bsl';
            request = 'launch';
            name = "Отладка 1Script";
            program = "${file}";
            cwd = '${workspaceFolder}';
            args = {};
            -- env = {};
            runtimeExecutable = "/home/nick/.local/share/ovm/current/bin/oscript";
            runtimeArgs = {};
            debugPort = 2801;
          }
        }

        dap.adapters.onec = {
          id = 'onec';
          type = 'executable';
          command = 'dotnet'; 
          args = {"/home/nick/.vscode/extensions/akpaevj.onec-debug-0.2.1/bin/OnecDebugAdapter.dll"};
          name = 'onec';
        }

        dap.configurations.onec = {
          {
            type = 'onec';
            request = 'launch';
            name = "Отладка 1С (запуск)";
            platformPath = "/opt/1cv8/x86_64";
            rootProject = "${workspaceFolder}/src";
            debugServerHost = "localhost";
            infoBase = "empty";
--            autoAttachTypes = {
--                "ManagedClient",
--                "Server"
--            }
          }
        }

    end,
  },

}

