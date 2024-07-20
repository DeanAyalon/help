# Stage 1: Build the app
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm install -g serve

# Copy the rest of the app's source code
COPY . .

# Build the app
RUN npm run build

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the app
CMD ["npm", "run", "serve"]