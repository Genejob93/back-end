# 进阶1: 基础查询
/*
  语法:
  select 查询列表  from 表名;
  
  1. 查询列表可以是: 表中的字段,   常量值,  表达式,   函数
  2. 查询的结果是一个虚拟的表格
*/

# 1. 查询表中的单个字段
SELECT last_name FROM employees;

#2. 查询表中的多个字段
SELECT last_name,salary,email FROM employees;

#3. 查询表中所有字段
SELECT 
  * 
FROM
  employees ;
  
# 4. 查询常量值
SELECT 100;
SELECT 'Gene';

#5. 查询表达式
SELECT 100%98;

#6. 查询函数
SELECT VERSION();


#7. 为查询字段起别名
/*
  1. 起别名, 便于理解
  2. 如果要查询的字段有重名的情况, 使用别名可以区分开来
*/

#方式一; 使用 as
SELECT 100%98 AS 别名;
SELECT 100%98 AS 结果;
#方式二 省略 使用空格, 省略 as
SELECT last_name 姓 FROM employees;


#8. 去重
  #案例: 查询员工表中涉及到的所有的部门编号
  SELECT DISTINCT department_id FROM employees;
  
#9. + 号的作用
  /*
     mysql 中的 + 号仅仅只有一个功能:  运算符 加法
  */
  #案例: 查询员工名 和 姓 连接为一个字段, 并显示为 姓名
  SELECT 
      CONCAT(last_name, first_name) AS 姓名 
  FROM employees;
  
  
#10. 判断是否为空的函数
    SELECT IFNULL(`commission_pct`, 0) AS 奖金率, commission_pct FROM employees;                                          
  
  
  
  
  
  
  
  
  
  
  
  
