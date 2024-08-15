# Tips

## FZF

Open a preview window for files while searching

```bash
fzf --preview="cat {}"
```

This will open vim when selecting the file

```bash
vi $(fzf --preview="cat {}")
```

`**` + `Tab` -> Start searching from the current dir

```bash
cd INVENIO/**
```

 Killing processess by just selecting the one

```bash
kill -9 ** + Tab
```

Unalias certain command you have

```bash
unalias ** + Tab
```

## Invenio

```bash
invenio-cli assets watch
```

got error System limit for number of file watchers reached, watch 

check:

```bash
cat /proc/sys/fs/inotify/max_user_watches 65536
```

fix:

```bash
sudo sysctl fs.inotify.max_user_watches=524288
```