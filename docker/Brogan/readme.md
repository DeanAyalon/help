[![Source](https://img.shields.io/badge/source-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/channels/460871933748183040/1244394543709950043/1244394543709950043)

I did not really help much, just saw some weird configurations, and asked questions to learn what's going on, and maybe identify the problem.

## [Docker Compose](./compose.yml)
```yml
volumes:
  - .:/usr/src/app:delegated
  - /usr/src/app/node_modules
```

## [Dockerfile](./dockerfile)
```dockerfile
COPY ./package.json .
COPY ./package-lock.json .

RUN npm install
COPY . .
```

The way the Compose seems to work:
- The first mount overrides the files in the image, allowing development without building a non-production image<br>
  This does require running `npm i` in the project.
- The first time the second mount is created, it's initialized with the contents defined within the image, or mounted from host (CHECK WHICH).<br>
  Then, it does not change with the image, and so the contents of the node_modules directory persist when updating the image or the host's node modules!

This ensures the code is executed with the packages built into the image. Within the container, node_modules does not update when changing the host's node_modules directory contents (if exists)

# User Info
![Discord - brogan0355](https://img.shields.io/badge/brogan0355-5865F2?style=for-the-badge&logo=discord&logoColor=white)


# TODO
- Check how the dockerfile behaves, copying the node_modules directory to the image after npm i, what would be the result, and why do it?