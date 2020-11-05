# 使用ruby 2.7.1
FROM phusion/passenger-ruby27:latest

# 安装依赖工具
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN apt-get update && apt-get install -y netcat

# 配置nginx
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

# 准备Gemfile文件
COPY Gemfile* /tmp/
# 安装bundler及gems
WORKDIR /tmp
RUN bundle install --jobs 5

# 设置工作目录，设置好了之后就不用每次执行下面的拷贝文件命令之前都要cd到这个目录
RUN usermod -u 1000 app
WORKDIR /home/app/webapp
RUN chown -R app:app .

# 将package.json及yarn.lock拷贝到docker的工作目录
COPY package.json .
COPY yarn.lock .
# 安装npm packages
RUN yarn install

# RUN rails webpacker:install

# 暴露80端口
EXPOSE 80
