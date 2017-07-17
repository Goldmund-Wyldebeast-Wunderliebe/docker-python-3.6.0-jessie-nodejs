FROM python:3.6.1

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8
ENV GPG_KEY 0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
ENV PYTHON_VERSION 3.6.0

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 9.0.1

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        build-essential \
        ca-certificates \
        curl \
        git \
        libbz2-dev \
        libc6-dev \
        libffi-dev \
        libgdbm3 \
        libicu-dev \
        libgdbm3 \
        libjpeg62 \
        libjpeg62-turbo-dev \
        libsqlite3-0 \
        libssl-dev \
        libssl-dev \
        libssl1.0.0 \
        libxml2 \
        libxml2-dev \
        libxmlsec1 \
        libxmlsec1-dev \
        libxslt1-dev \
        libxslt1.1 \
        locales \
        python-dev \
        python-pip \
        python-setuptools \
        rsync \
        sudo \
        xvfb


# install "virtualenv", since the vast majority of users of this image will want it
RUN pip install --no-cache-dir virtualenv

# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& { [ -e easy_install ] || ln -s easy_install-* easy_install; }

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
# Install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash


RUN mkdir -p /usr/lib/firefox47/
RUN wget -qO- https://ftp.mozilla.org/pub/firefox/releases/47.0.1/linux-x86_64/en-GB/firefox-47.0.1.tar.bz2 | tar jx -C /usr/lib/firefox47/ --strip-components=1

ENV FIREFOX_BIN_PATH /usr/lib/firefox47/firefox

CMD ["python3"]
