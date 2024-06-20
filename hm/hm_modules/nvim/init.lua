local dap_ui_ok, ui = pcall(require, "dapui")
if not (dap_ok and dap_ui_ok) then
  require("notify")("dap-ui not installed!", "warning")
  return
end

dap.configurations = {
    haskell = {
        {
            type = "haskell",
            name = "Debug",
            requestgt
