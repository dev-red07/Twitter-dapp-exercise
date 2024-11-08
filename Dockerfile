# Stage 1: Build the application
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app


# Copy the rest of the application
COPY . .



# Install dependencies
RUN yarn install

# Build the Next.js application
RUN yarn run build


# Expose the port the app runs on
EXPOSE 3000

# Start the Next.js application
CMD ["yarn", "start"]