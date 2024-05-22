# Docker error

Ports are already allocated but when you do `docker ps`it's empty.

Solution:
Switch to root and remove the running containers there. it's hidden from the user if you are not root.