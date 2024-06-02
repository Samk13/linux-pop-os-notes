## Docker

Ports are already allocated but when you do `docker ps`it's empty.

Solution:
Switch to root and remove the running containers there. it's hidden from the user if you are not root.

## Azure CLI

After installing
./scripts/run_full_container.sh
Error saving credentials: error storing credentials - err: exit status 1, out: `error storing credentials - err: exit status 1, out:`pass not initialized: exit status 1: Error: password store is empty. Try "pass init".``
Login failed.

$$$user@pcname:~/$ gpg --generate-key

gpg (GnuPG) 2.2.27; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Note: Use "gpg --full-generate-key" for a full featured key generation dialog.

GnuPG needs to construct a user ID to identify your key.

Real name: put your name
Email address:
You selected this USER-ID:
    "your name <youremail>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? o
...
public and secret key created and signed.

pub   rsa3072 2024-05-22 [SC] [expires: 2026-05-22]
      asdasdasdasdasdasdasd

$$$user@pcname:~/$ gpg --list-keys
/home/user/.gnupg/pubring.kbx
-------------------------------

pub   rsa3072 2024-05-22 [SC] [expires: 2026-05-22]
      asdasdasdasdasdasdasd

$$$user@pcname:~/$ pass init asdasdasdasdasdasdasd
Password store initialized for asdasdasdasdasdasdasd

$$$user@pcname:~/$ pass list
Password Store

$$$user@pcname:~/$ az acr login --name daffyregistry01
Login Succeeded

$$$user@pcname:~/$ ./scripts/run_full_container.sh
Login Succeeded

## Kill processes

After running this command, click on the window you wish to close.

```bash
xkill
```

Using xkill is a quick and effective way to deal with unresponsive applications in a graphical environment.
