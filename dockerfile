# Use Node.js 16 image as the base
FROM node:16

# Set the working directory for the server
WORKDIR /usr/src/app/server

# Copy the server's package.json and package-lock.json
COPY server/package*.json ./

# Install the server dependencies (including TensorFlow and Express)
RUN npm install @tensorflow/tfjs-node --legacy-peer-deps
RUN npm install --legacy-peer-deps

# Rebuild native modules to match the Linux environment in Docker
RUN npm rebuild

# Set the working directory for the client
WORKDIR /usr/src/app/client

# Copy the client's package.json and package-lock.json
COPY client/package*.json ./

# Install the client dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the server and client application code
WORKDIR /usr/src/app
COPY . .

# Remove any existing node_modules (in case they were copied from host)
RUN rm -rf server/node_modules client/node_modules

# Expose the port (change it if your app uses a different port)
EXPOSE 6969

# Command to start the server
CMD ["node", "server/index.js"]