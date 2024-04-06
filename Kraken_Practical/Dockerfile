# Use a minimal base image
FROM golang:1.16-alpine AS builder

# Set up non-root user
RUN adduser -D -g '' appuser

# Set working directory
WORKDIR /home/appuser

# Install necessary dependencies
RUN apk add --no-cache git build-base

# Clone the Gaia repository and checkout the desired version
RUN git clone --branch v14.2.0 --single-branch https://github.com/cosmos/gaia.git

# Change working directory to Gaia
WORKDIR /home/appuser/gaia

# Build the Gaia binary
RUN make install

# Start a new stage from a minimal base image
FROM alpine:latest

# Set up non-root user
RUN adduser -D -g '' appuser

# Copy the compiled binary from the previous stage
COPY --from=builder /home/appuser/go/bin/gaiad /usr/local/bin/
COPY --from=builder /home/appuser/go/bin/gaiacli /usr/local/bin/

# Set permissions for the binaries
RUN chmod +x /usr/local/bin/gaiad /usr/local/bin/gaiacli

# Expose necessary ports
EXPOSE 26656 26657 1317

# Set up entry point to run the gaiad daemon and print its output
ENTRYPOINT ["gaiad", "start", "--log_level", "info"]
