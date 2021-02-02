FROM archlinux:latest

RUN pacman -Syu --noconfirm && pacman -S --noconfirm git vim nodejs wget zsh npm python-pip htop && \
      git config --global user.name "John Doe" && \
      git config --global user.email johndoe@example.com

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN npm install --global http-server phaser 

ARG WORKSPACE=/root 
WORKDIR $WORKSPACE

COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

RUN vim +PlugInstall +qall 

CMD ["zsh"]
