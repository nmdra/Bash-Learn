# Start from the official Ubuntu image
FROM ubuntu:latest

# Set environment variables to avoid interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:neovim-ppa/stable && \
    apt-get update && \
    apt-get install -y \
    neovim \
    bash \
    curl \
    jq \
    htop \
    fzf \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom .bashrc file into the container
COPY .bashrc /root/.bashrc

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Set the default command to start an interactive bash shell
CMD ["bash"]

