create database blog default charset 'utf8mb4';

use blog;

create table articles(
	a_id int(11) primary key auto_increment comment '文章的id',
	a_title varchar(100) comment '文章的标题',
	a_begin_text varchar(400) comment '文章的简介',
	a_content varchar(800) comment '文章内容',
	a_date timestamp comment '文章创建时间',
	a_uid int(11) comment'文章作者id',
	a_photo varchar(50) comment'文章配图名称'
);


create table users(
	u_id int(11) primary key auto_increment,
	u_email varchar(50) comment '邮箱',
	u_name varchar(50) comment '用户名',
	u_password varchar(50),
	u_role int comment'身份，1为普通用户',
	u_photo varchar(50) comment'用户头像名称',
	u_introduce varchar(800) comment '个人简介',
	u_lasttime timestamp default current_timestamp on update current_timestamp comment '最近登录的时间'
);

create table messages(
	m_id int(11) primary key auto_increment,
	m_name varchar(100) comment'浏览者用户名',
	m_content varchar(300) comment'留言内容',
	m_uid int(11),
	m_date timestamp comment'留言添加时间'

);

create table photos(
	p_id int(11) primary key auto_increment,
	p_name varchar(50) comment'照片名称',
	p_date timestamp comment'照片上传时间',
	p_uid int(11)
);

insert into users values(default,'123456@qq.com','admin','123456',0,'gsm.jpg','第一次想做这么一个网站，去记录自己的生活和学习，前行的脚步太过匆忙，不如停下来好好整理整理，自己选择的路，不论如何都要走完。',default);

insert into articles values
	(default,'关于我的介绍','第一次尝试制作php个人博客网站',
	'第一次想做这么一个网站，去记录自己的生活和学习，前行的脚步太过匆忙，不如停下来好好整理整理，自己选择的路，不论如何都要走完。',default,1,'first.jpg');
insert into articles values(default,'Docker领域再添一员，网易云发布“蜂巢”，加入云计算之争','Docker领域再添一员，网易云发布“蜂巢”，加入云计算之争','Docker领域再添一员，网易云发布“蜂巢”，加入云计算之争',default,1,'text1.jpg');


insert into photos values(default,'001.jpg',default,'1');
insert into photos values(default,'002.jpg',default,'1');
insert into photos values(default,'003.jpg',default,'1');
insert into photos values(default,'004.jpg',default,'1');
insert into photos values(default,'005.jpg',default,'1');


insert into messages values(default,'bobo','很喜欢你写的文章，希望继续更新',1,default);
insert into articles values(default,'mysql中文乱码','mysql中文乱码','1.创建数据库时就用default charset 'utf8'设置编码
  2.通过show variables like '%char%';查看数据库默认字符集
  3.编辑my.cnf文件，在文件的[client],[mysqld_safe],[mysqld],[mysql]下新加 default-character-set=utf8',default,1,'11.jpg');

insert into articles values(default,'mysql单表多个查询','mysql单表多个查询','通过select *from 表名 where locate(?,concat(列名,列名,列名))查询',default,1,'22.jpg');

insert into articles values(default,'mysql分页','mysql分页','通过“select *from 表名 limit pageno”结构的语句查询',default,1,'33.jpg');
insert into articles values(default,'php操作数据库','php的pdo操作','1.连接：$pdo = new PDO("mysql:host=localhost;dbname=数据库名","用户名","密码");
  2.query($sql); 用于执行查询SQL语句。返回PDOStatement对象
  3.exec($sql); 用于执行增、删、改操作，返回影响的行数
  4.lastInsertId 获取刚刚添加的主键值；',default,1,'10.jpg');
insert into articles values(default,'php得到数据库结果','php得到数据库结果','1.fetch() 返回结果集的下一行，结果指针下移，到头返回false；
2.fetchAll() 通过一次调用返回所有结果，结果是以数组形式保存；
3.fetchColumn()返回结果集中下一行某个列的值；',default,1,'555.jpg');


