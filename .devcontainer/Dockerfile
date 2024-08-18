FROM amazonlinux:2

RUN sudo apk --update add \
    && git~=2.46.0 \
    && aws-cli~=2.15.57

RUN cd ~ \
    && git clone https://github.com/tfutils/tfenv.git .tfenv
    && export PATH=$PATH:~/.tfenv/bin
    && tfenv install 1.9.4
    && tfenv use 1.9.4