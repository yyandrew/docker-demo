# 使用ruby 2.7.1
FROM ruby:2.7.1

# 安装依赖工具
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

# 创建一个项目目录
RUN mkdir /app
# 设置工作目录，设置好了之后就不用每次执行下面的拷贝文件命令之前都要cd到这个目录
WORKDIR /app

# 暴露3000端口
EXPOSE 3000

# 准备Gemfile文件
COPY Gemfile .
COPY Gemfile.lock .
# 安装bundler及gems
RUN gem update bundler
RUN bundle install --jobs 5

# 将package.json及yarn.lock拷贝到docker的工作目录
COPY package.json .
COPY yarn.lock .
# 安装npm packages
RUN yarn install
