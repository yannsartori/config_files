local lib = '/usr/local/lib/node_modules'
local cmd = { 'node', lib .. '/@angular/language-server', '--tsProbeLocations', lib, '--ngProbeLocations', lib, '--stdio' }

return {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  flags = {
      debounce_text_changes = 150,
  },
}
