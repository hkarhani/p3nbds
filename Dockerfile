FROM hkarhani/p3nb:latest

MAINTAINER Hassan El Karhani <hkarhani@gmail.com>

RUN apk update && apk --no-cache add freetype freetype-dev libpng jpeg-dev 
RUN apk --no-cache add zlib-dev make cmake gcc g++ gfortran libffi-dev openssl openssl-dev
RUN apk --no-cache add linux-headers openblas openblas-dev py3-scipy py3-lxml
RUN pip3 install --upgrade pip

WORKDIR /notebooks

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8888

CMD /bin/sh -c "/usr/bin/jupyter notebook --allow-root"