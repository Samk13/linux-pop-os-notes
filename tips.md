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
