vim.opt.relativenumber = true
if vim.loop.os_uname().sysname == 'Windows_NT' then
  -- Check if 'pwsh' (PowerShell Core) is available, otherwise use 'powershell'
  vim.opt.shell = 'pwsh-preview.cmd'

  -- Configure shellcmdflag
  vim.opt.shellcmdflag =
    '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues["Out-File:Encoding"]="utf8";Remove-Alias -Force -ErrorAction SilentlyContinue tee'

  -- Configure shellredir
  vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'

  -- Configure shellpipe
  vim.opt.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'

  -- Set shellquote and shellxquote to empty strings
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end
