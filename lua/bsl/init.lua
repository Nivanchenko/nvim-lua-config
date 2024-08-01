
require("dapui").setup()

local dap = require("dap")

dap.adapters.bsl = {
  id = 'oscript';
  type = 'executable';
  command = 'mono'; 
  args = {"/Users/n.ivanchenko/.vscode/extensions/evilbeaver.oscript-debug-0.8.0/bin/VSCode.DebugAdapter.exe"};
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
    runtimeExecutable = "/Users/n.ivanchenko/.local/share/ovm/OS20/oscript";
    runtimeArgs = {};
    debugPort = 2801;
  }
}
