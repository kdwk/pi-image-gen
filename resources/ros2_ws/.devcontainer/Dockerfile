FROM ros:jazzy

ARG USERNAME
ARG USER_UID=1001
ARG USER_GID=$USER_UID
ARG HOME="/home/${USERNAME}"

# Create the user
RUN chsh -s /bin/bash

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory \
    && echo "$SNIPPET" >> "${HOME}/.bashrc"

RUN apt --yes update && apt --yes upgrade
RUN apt --yes install clang ccache ros-dev-tools python3-colcon-clean python3-colcon-cd ros-jazzy-ament-clang-format systemd-coredump gdb

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************
USER $USERNAME

ADD "./resources/colcon-defaults.yaml" "${HOME}/.colcon/defaults.yaml"
ADD "./resources/m2-source.bash" "${HOME}/.m2-source.bash"

RUN echo "source ${HOME}/.m2-source.bash" >> "${HOME}/.bashrc"

CMD [ "/bin/bash" ]