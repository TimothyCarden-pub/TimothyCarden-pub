# Use a minimal base image for building
FROM golang:1.20-alpine AS builder

# Set necessary environment variables
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Install Git and Make
RUN apk update && apk add --no-cache git make

# Set the working directory inside the container
WORKDIR /app

# Clone the Gaia repository and checkout the desired version
RUN git clone --branch v14.2.0 --depth 1 https://github.com/cosmos/gaia.git .

# Print the directory content to verify the files
RUN ls -la

# Run 'go mod download' to resolve dependencies
RUN go mod download

# Build Gaia (disabling Ledger support)
RUN make LEDGER_ENABLED=false

# Use a new stage for the runtime image
FROM alpine:3.14

# Set timezone to UTC
ENV TZ=UTC

# Install ca-certificates to support HTTPS communications
RUN apk update && apk add --no-cache ca-certificates

# Copy the built Gaia binary from the builder stage
COPY --from=builder /app/gaiad /usr/local/bin/gaiad
COPY --from=builder /app/gaiacli /usr/local/bin/gaiacli

# Expose the necessary ports for the Gaia daemon
EXPOSE 26656 26657 1317

# Run the Gaia daemon and print its output to the console
CMD ["gaiad", "start", "--log_level", "info"]
