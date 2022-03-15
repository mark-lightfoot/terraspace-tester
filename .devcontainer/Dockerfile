FROM eu.gcr.io/cts-public-images-1/cts-standard:latest

RUN sudo apt-get update -y && sudo apt-get install -y file

RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    curl -sSL https://get.rvm.io | bash -s stable && \
    gem install bundler && \
    gem pristine --all && \
    gem install terraspace

RUN echo "PATH=$PATH:/usr/local/rvm/gems/ruby-3.0.0/bin" >> /home/vscode/.bashrc
RUN echo "PATH=$PATH:/usr/local/rvm/gems/ruby-3.0.0/bin" >> /home/vscode/.zshrc
