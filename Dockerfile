# Step 1: Specify the base image
FROM node:18

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy the package.json and yarn.lock files
COPY package.json yarn.lock ./

# Step 4: Install Python and build essentials
RUN apt-get update && \
    apt-get install -y python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Step 5: Install dependencies
RUN yarn install

# Step 6: Copy the rest of your application code
COPY . .

# Step 7: Build the application
RUN yarn build

EXPOSE 1234

# Step 8: Specify the command to run the application
CMD ["yarn", "start"]
