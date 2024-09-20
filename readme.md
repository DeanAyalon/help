[source](https://discord.com/channels/460871933748183040/669474776393187328/1286600770715648020)

# Problem
OP wants to run containers dertached from the terminal, but still follow their logs. 

## Solution
`docker compose logs -f` does what they're looking for

----
# Workspace
This branch uses `tools` as a Git worktree
```sh
git worktree add tools
```