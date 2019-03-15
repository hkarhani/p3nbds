FROM hkarhani/p3nb:latest

MAINTAINER Hassan El Karhani <hkarhani@gmail.com>

RUN apk update && apk --no-cache add freetype freetype-dev libpng jpeg-dev 
RUN apk  add zlib-dev make cmake gcc g++ gfortran libffi-dev openssl openssl-dev
RUN apk  add linux-headers openblas openblas-dev py3-numpy py3-numpy-dev py3-scipy py3-lxml
RUN pip3 install pandas

WORKDIR /notebooks

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

EXPOSE 8888

CMD /bin/sh -c "/usr/bin/jupyter notebook --allow-root"