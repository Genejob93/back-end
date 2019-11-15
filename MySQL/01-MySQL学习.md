[TOC]

# MySQL学习

# 1 mysql

## 1.1 MySQL基础

> **mysql 注释** 
>
> ```js
> # 注释
> -- 注释
> /* 注释文字 */
> ```

### 1.1.1 mysql 开启服务,登录退出命令

> **CMD命令启动 mysql数据库服务**

```js
net stop mysql	// 关闭mysql 服务
net start mysql	// 启动mysql 服务
```

> **登录 mysql 数据库客户端** 
>
> mysql 不区分大小写, 但建议关键字大写, 表名, 列名大写

```js
//1. mysq -h主机名 -P端口号 -u用户名	-p密码
	mysql -hlocalhost -P3306 -uroot -p					// 连接本地的数据库

//2. 登录mysql数据库   "简写"
	mysql -uroot -p

//3. exit  或者 ctrl+C 退出 mysql数据库
	exit
```

> **登录数据库后的命令**

```js
//1. 显示当前有多少数据库
	show databases;

//2. 进入使用指定 某个数据库  use  数据库名;
	use test;

//3. 显示当前数据库的多少表
	show tables;
	show tables from test;

//4. 查看当前在哪个数据库
	select database();

```

> **创建数据库表** 

```js
# 创建数据库表
create table stuinfo(
	id int,
  name varchar(20)
);

# 插入数据
	insert into stuinfo(id,name) values(2,"Gene");
# 查看数据
	select * from stuinfo;

## 查看表结构 desc 表名
	desc stuinfo;
```

> **查看当前mysql的版本**

```js
# 1. 未登录mysql状态下查看 
	mysql --version      # 没有分号

# 2. 登录mysql 状态后
select version();

```

# 2. mysql 语言学习

## 2.1 DQL语言学习 



## 2.2 DML 语言学习



## 2.3 DDL 语言学习



## 2.4 TCL语言学习































































































































































































































































































































































