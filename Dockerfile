# Use an official node image as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the app
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Expose port 3000
EXPOSE 3050

# Command to run the app
CMD ["serve", "-s", "build", "-l", "3000"]
