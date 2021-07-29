FROM ruby:2.7.2
RUN gem install solargraph
RUN gem update solargraph

EXPOSE 7658

CMD ["solargraph", "socket", "--host=0.0.0.0", "--port=7658"]
