FROM hkarhani/p3nb:latest

MAINTAINER Hassan El Karhani <hkarhani@gmail.com>

RUN apk add --update curl gcc g++ && rm -rf /var/cache/apk/*
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN pip install bottle numpy cython pandas

WORKDIR /notebooks

EXPOSE 8888

CMD /bin/sh -c "/usr/bin/jupyter notebook --allow-root"
