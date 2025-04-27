
# e.g look for all .venv in folder and show size
# -type d -name '.venv' — only look at directories literally called .venv
# -prune — don’t descend into them once found (faster).
# du -sh — “disk usage”, human-readable, one line per match.
# + — batches paths so du runs as few times as possible.
find . -type d -name '.venv' -prune -exec du -sh {} +


#  Get the total disk space they use

# du -sch adds a running cumulative total (-c) at the end.
# tail -n1 picks that “total” line so you just see one number (still human-readable).

du -sch $(find . -type d -name '.venv' -prune) | tail -n1


# DRY-RUN: shows what would be removed
find . -type d -name '.venv' -prune -print

# REAL DEAL: actually delete
find . -type d -name '.venv' -prune -exec rm -rf {} +