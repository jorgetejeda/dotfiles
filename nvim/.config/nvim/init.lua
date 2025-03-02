-- require("jtejeda.core")
-- require("jtejeda.lazy")

-- May configuration
if vim.g.vscode then
  print("Vscode is working")
else
  require("may.core")
  require("may.lazy")
end
