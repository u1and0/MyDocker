FROM base/archlinux
MAINTAINER u1and0 <e01.ando60@gmail.com>

# Install FISH
RUN pacman -Syu --noconfirm fish sudo

# Create user `docker`, switch to user and set directory to their home.
ARG USERNAME="docker"
ARG USERSHELL="/usr/bin/fish"
RUN useradd -m -d /home/$USERNAME -s $USERSHELL -g users -G users,wheel $USERNAME
# RUN useradd -p docker -g wheel --create-home --shell $USERSHELL $USERNAME

# ADD sudoers /etc/sudoers

# Normal user treat as root user.
RUN sed -i -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
# RUN sed -i -e 's/%wheel ALL=(ALL) ALL/# %wheel ALL=(ALL) ALL/' /etc/sudoers
RUN visudo -c

RUN chown root:root /etc/sudoers && chmod 440 /etc/sudoers



# User home dir
WORKDIR /home/$USERNAME
USER $USERNAME


# Provided an absolute path here instead. `git` didn't seem able to use it
# and `zplug install` seemed to throw some errors
# ENV ZPLUG_HOME /home/docker/.zplug

# Install zplug
# RUN git clone https://github.com/zplug/zplug $ZPLUG_HOME
# RUN usermod -G docker root
#
# # Creating a .zshrc, you could use ADD to include an actual file instead
# RUN echo 'source ~/.zplug/init.zsh' > .zshrc \
#     && echo 'zplug "sindresorhus/pure", use:"{async,pure}.zsh"' >> .zshrc \
#     && echo 'zplug "zsh-users/zsh-syntax-highlighting", nice:10' >> .zshrc \
#     && echo 'zplug load --verbose' >> .zshrc
#
# Install the plugins/packages, commit container changes after to a new image
# CMD ["chsh", "-s", "docker", "/usr/bin/fish"]
# CMD ["bash"]
