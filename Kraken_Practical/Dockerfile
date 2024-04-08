# Use a minimal base image
FROM golang:1.16-alpine AS builder

# Set necessary environment variables
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Install Git
RUN apk update && apk add --no-cache git make

# Set the working directory inside the container
WORKDIR /app

# Clone the Gaia repository and checkout the desired version
RUN git clone --branch v14.2.0 --depth 1 https://github.com/cosmos/gaia.git .

# Build Gaia
RUN make install

# Use a new stage for the runtime image
FROM alpine:3.14

# Set timezone to UTC
ENV TZ=UTC

# Install ca-certificates to support HTTPS communications
RUN apk update && apk add --no-cache ca-certificates

# Copy the built Gaia binary from the builder stage
COPY --from=builder /go/bin/gaia /usr/local/bin/gaia

# Expose the necessary ports for the Gaia daemon
EXPOSE 26656 26657 1317

# Run the Gaia daemon and print its output to the console
CMD ["gaia", "start", "--log_level", "info"]
