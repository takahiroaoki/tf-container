FROM amazonlinux:2023.1.20230809.0

# dnf fixes tool versions
RUN dnf install -y \
         git \
         unzip \
         sudo \
     && rm -rf /var/cache/dnf/* \
     && dnf clean all

# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install

# useradd
RUN useradd "dev-user" && echo "dev-user ALL=NOPASSWD: ALL" >> /etc/sudoers
USER dev-user

# install tfenv & terraform
WORKDIR /home/dev-user
RUN git clone https://github.com/tfutils/tfenv.git .tfenv
ENV PATH $PATH:/home/dev-user/.tfenv/bin
RUN tfenv install 1.9.4 \
    && tfenv use 1.9.4
