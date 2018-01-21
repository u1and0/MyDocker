FROM base/archlinux
MAINTAINER u1and0 <e01.ando60@gmail.com>

# Install FISH
RUN pacman -Syu --noconfirm fish sudo

# Create user `docker`, switch to user and set directory to their home.
ARG USERNAME="docker"
RUN useradd -m -d /home/$USERNAME -s /usr/bin/fish -g users -G users,wheel $USERNAME


# Normal user treat as root user.
RUN sed -i -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
RUN visudo -c


# User home dir
WORKDIR /home/$USERNAME
USER $USERNAME

