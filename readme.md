[Help Thread](https://discord.com/channels/460871933748183040/1244394543709950043/1244394543709950043)

The Docker configurations look weird to me, which may or may not be related to the problem Brogan is experiencing0

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

I am yet to understand the reason for this, but in the discussion, Grasume claims it's good practice.


# TODO
- Check which initializes the second mount - host mount or image
- Check how the dockerfile behaves, copying the node_modules directory to the image after npm i, what would be the result, and why do it?