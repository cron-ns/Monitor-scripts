FROM ruby:latest
ENV RVM_VERSION=2.7.0
ENV TEST_FILE=test.sh
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN chmod +x test.sh
CMD ["/myapp/test.sh"]
