[source](https://discord.com/channels/460871933748183040/460871933748183042/1286358213339512895)

# Problem
Can't seem to install pnpm
> Worked for me when entering the container<br>
> However, using `docker exec -it dummy pnpm` failed, pnpm not found in `$PATH`

# Repository setting
This branch uses `tools` as a worktree
```sh
git worktree add tools