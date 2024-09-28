[source](https://discord.com/channels/460871933748183040/460871933748183042/1289372778432299058)

# Goal
Copy all files with an extension

## Solution
Copy all files with `.` in their name, to match for extension. 
> Will also copy directories like `.git`, so they should be in `.dockerignore`

```dockerfile
COPY *.* .
```