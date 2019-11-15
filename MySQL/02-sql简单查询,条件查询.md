[TOC]

## 1. mysql基础查询

```js
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
  
```

## 2. sql 条件查询

```js
#进阶2: 条件查询
/*
  语法:   先执行 from, 再执行 where, 最后执行查询 select
      select 
	查询列表
      from 
	表名
      where
	筛选条件;
	
   分类:
	1. 按条件表达式筛选
		条件运算符: > < =   不等于<>   >=  <=

	2. 按逻辑表达式筛选
		逻辑运算符: &&    ||    ! 
			    and   or    not 
	
	3. 模糊查询
		like
		between and
		in
		is null		
		
*/

#一. 按条件表达式筛选
   #案例一: 查询工资 >12000 的员工信息
   SELECT * FROM employees WHERE `salary` >=12000;
   
   #案例2: 查询部门编号不等于 90 号的 员工名和部门编号
   SELECT
	`last_name`,`department_id`
   FROM 
	employees
   WHERE 
	department_id <> 90;
	
	
#二: 按逻辑表达式筛选
	#案例: 查询工资在 10000 到 20000 之间的员工名, 工资 以及 奖金
	SELECT last_name, salary, commission_pct 
	FROM employees 
	WHERE salary >=10000 AND salary <=20000;
	
	#案例2: 查询部门编号不是在 90 到 110 之间, 或者工资高于 15000 的员工信息
	SELECT * FROM employees 
	WHERE department_id <90 OR department_id >110 OR salary>15000; 
 

#三: 模糊查询
	/*
	 like
	   特点: 一般和通配符搭配使用
		%  任意多个字符, 包含 0 个字符
		_  任意单个字符
		
	 between and
	     /*
		1. 使用 between and 可以提高语句的简洁度
		2. 包含临界值
		3. 两个临界值不要调换顺序.
		
	     */
	 IN
	    /*
		in含义: 判断某字段的值是否属于in 列表中的某一项
		特点:
		   1. 使用 in 提高了语句简洁渡
		   2. in 列表的值类型, 必须统一 或 兼容
		
	    */
	 IS NULL | IS NOT NULL
	   /*
	      = 或 <> 不能用于判断 null值
	      is null 或 is not null 可以判断 null 值
	   */
	
    #1. like
	#案例1: 查询员工名中包含字符 a 的员工信息
	SELECT * FROM employees WHERE last_name LIKE '%a%';
	
	#案例2: 查询员工名中 第三个字符为 n, 第五个字符为 l 的员工名和工资
	SELECT last_name, salary FROM employees WHERE last_name LIKE '__n_l%';
	
	#案例3: 查询出员工名中 第二个字符为 _ 的员工名
	SELECT last_name FROM employees WHERE last_name LIKE '_\_%';
	# 自定义 转义字符.  escape
	SELECT last_name FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';
	

    #2. between and
	#案例1: 查询 员工编号在 100 到 120 之间的所有员工信息
	SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 120;

    #3. in 关键字
        #案例: 查询员工的工种编号是 IT_PROT , AD_VP, AD_PRES中的一个员工的员工名和工种编号
        SELECT last_name,job_id FROM employees WHERE job_id IN('IT_PROT' , 'AD_VP', 'AD_PRES');                                

    #4. is null
        #案例1: 查询没有奖金的员工名和奖金率
        SELECT last_name, commission_pct FROM employees WHERE commission_pct IS NULL;
        #案例2: 有奖金的
        SELECT last_name, commission_pct FROM employees WHERE commission_pct IS NOT NULL;


#安全等于 <=> 
     #案例1: 查询没有奖金的员工名和奖金率
    SELECT last_name, commission_pct FROM employees WHERE commission_pct <=> NULL;

# is null  vs <=> 
   IS NULL: 仅仅可以判断 NULL值, 可读性较高
   <=>:     既可以判断普通值, 又可以 判断 NULL 值
   
   #案例: 查询员工号为 176 的员工的 姓名 和 部门号 和 年薪
   SELECT 
	last_name,
	department_id,
	salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
   FROM employees
    WHERE employee_id = 176;


```

