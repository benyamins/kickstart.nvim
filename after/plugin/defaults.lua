vim.opt.relativenumber = true

if vim.loop.os_uname().sysname == 'Windows_NT' then
  local powershell_options = {
    shell = 'pwsh.exe',
    shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
    shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
    shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
    shellquote = '',
    shellxquote = '',
  }

  for option, value in pairs(powershell_options) do
    vim.o[option] = value
  end
end

if vim.g.neovide then
  vim.o.guifont = 'JetBrains Mono:h9' -- text below applies for VimScript
end
