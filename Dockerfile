FROM ruby:latest
MAINTAINER Xu Fan <drowterran@gmail.com>

# install fake-s3
RUN bundle config --global frozen 1
RUN mkdir -p /fakes3_src
WORKDIR /fakes3_src
RUN git clone https://github.com/fanxu/fake-s3.git
WORKDIR /fakes3_src/fake-s3
RUN bundle install

# run fake-s3
RUN mkdir -p /fakes3_root
ENTRYPOINT ["bin/fakes3"]
CMD ["-r",  "/fakes3_root", "-p",  "80"]
EXPOSE 80
