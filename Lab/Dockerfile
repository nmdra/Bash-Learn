# Uncomment man-db & manpages to install manpages
# default user = tux
# sudo enabled = true
# manpages enabled = false
# apt cache clean enabled = true
# custom bash prompt enabled = true 

# Start from the official Ubuntu image
FROM ubuntu:latest

# Set environment variables to avoid interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Set environment variables for the user
ENV USER_NAME=tux \
    USER_UID=1001 \
    USER_GID=1001

# Add metadata labels
LABEL maintainer="NIMENDRA" \
      version="1.0.0" \
      repository="https://github.com/nmdra/Bash-Learn"
      description="Custom Ubuntu-based Docker image with additional tools and a non-root user." \

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
    file \
    sudo \
    # man-db \
    # manpages \
    git && \
    apt-get clean && apt-get autoclean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* # Comment this line to retain the apt cache

# Create a new user and group
RUN groupadd --gid $USER_GID $USER_NAME && \
    useradd --uid $USER_UID --gid $USER_GID --create-home $USER_NAME && \
    echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy the custom .bashrc file into the container
COPY .bashrc /root/.bashrc
COPY .bashrc /home/$USER_NAME/.bashrc

# Switch to the new user
USER $USER_NAME

# Set the working directory
WORKDIR /home/$USER_NAME/

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Set the default command to start an interactive bash shell
CMD ["bash"]
