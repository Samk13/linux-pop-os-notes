# Export Custom Keyboard Shortcuts


```bash
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > custom-shortcuts.dconf
```

This command saves your custom keyboard shortcuts to a file named custom-shortcuts.dconf.

## Import Custom Keyboard Shortcuts After Reinstall


```bash
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < custom-shortcuts.dconf
```