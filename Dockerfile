FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
# Required dependencies
    python2.7 \
    python-pip \
    python-dev \
    git \
    build-essential \
#suggested dependencies
    libffi-dev \
    libssl-dev \
    pcregrep \
    libpcre++-dev \ 
# utils for within container
    wget \ 
    unzip \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Suggested python dependencies
RUN pip install 'yara-python<4.0' 'pillow<6.0' distorm3 pycrypto

RUN mkdir -p /volatility
RUN git clone https://github.com/volatilityfoundation/volatility.git /volatility

# Create nice vol command
RUN echo "#!/bin/bash\npython2.7 /volatility/vol.py \"\$@\"" > /usr/local/bin/vol 
RUN chmod +x /usr/local/bin/vol

RUN mkdir /data
WORKDIR /data
VOLUME [ "/data" ]

ENTRYPOINT []
CMD ["/bin/bash"]
