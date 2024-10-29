insert into nboard2(unq,title,pass,name,content,rdate) values(nboard2_seq.nextval,'title','pass','name','content',sysdate);
select unq,title,name,to_char(rdate,'yyyy-mm-dd') rdate from nboard2;
select count(*) from nboard2 where unq = 2 and pass = '1234';
update nboard2 set title='title',pass='pass',name='name',content='content' where unq='unq';