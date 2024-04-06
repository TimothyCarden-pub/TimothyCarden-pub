# Use a base image with necessary dependencies (Ubuntu in this case)
FROM ubuntu:20.04

# Set environment variables
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    git \
    build-essential \
    curl

# Install Go 1.20
RUN wget https://golang.org/dl/go1.20.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz

# Clone Gaia repository
RUN git clone --branch v14.2.0 https://github.com/cosmos/gaia.git $GOPATH/src/github.com/cosmos/gaia

# Build Gaia
WORKDIR $GOPATH/src/github.com/cosmos/gaia
RUN make install

# Expose ports
EXPOSE 26656 26657 26660

# Configure and start Gaia
CMD ["gaiad", "start"]
