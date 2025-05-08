FROM node:10

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source inside Docker image
COPY . .

# Expose port and start application
EXPOSE 3000
CMD ["sh", "-c", "npm start"]
