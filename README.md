# 为Rails应用配置Docker开发环境

## 怎么使用

```
# 构建web容器
docker-compose build
# 在web服务里安装bundler
docker-compose run web bundle install
# 在web服务里安装npm package
docker-compose run web yarn install
# 通过web服务创建数据库
docker-compose run web rake db:create
# 通过web服务创建表及修改表结构
docker-compose run web rake db:migrate
# 启动所有服务
docker-compose up
# 停止所有服务
docker-compose down
```
Open [localhost](http://localhost)
