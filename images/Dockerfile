FROM ubuntu:20.04
ENV TZ=Europe/Moscow
ADD . .
RUN ln -s /usr/share/zoneinfo/Europe/Samara /etc/localtime
RUN apt update \
  && xargs apt install < packages.txt -y \
  && apt clean 
RUN python -m venv ~/.venv \
    && pip3 install -r requirements.txt
CMD ["/bin/bash"]