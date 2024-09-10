[source](https://discord.com/channels/460871933748183040/460871933748183042/1279400356475961355)

# Problems
OP was having troublewith basic things:
- Where to execute the `docker run` command
- Environment variables not properly defined, image tag should come after the flags, before the command itself. The container was trying to run `<entrypoint> -e ...`
- Extra spaces after `\` characters, escaping the space instead of the line-break
  ```
  '-e' is not recognized as an internal or external command, an executable program or a batch file.
  ```