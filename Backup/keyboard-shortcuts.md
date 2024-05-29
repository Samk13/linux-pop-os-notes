# Export Custom Keyboard Shortcuts


```bash
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > custom-shortcuts.dconf
```

This command saves your custom keyboard shortcuts to a file named custom-shortcuts.dconf.

## Import Custom Keyboard Shortcuts After Reinstall


```bash
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < custom-shortcuts.dconf
```


## Backup and Restore Configurations

Backup: Regularly backup your dconf settings to ensure you can quickly recover your configuration.

```bash
dconf dump / > full-backup.dconf
```

Restore: Restore the settings when needed.

```bash
dconf load / < full-backup.dconf
```