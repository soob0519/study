-- 정보등록 SQL 작성
-- 1. (목록) 기본정보 출력
-- * 번호, 이름, 생년월일, 연락처, 상태
-- * 이름순 (김씨 ~)
select stdnum,stdnm,substr(stdsec,1,6) birth,stdtel,stdste from stdinfo order by stdnm;

-- 2. (목록) 검색정보 출력
-- (1) 출력 내용을 기본(1번)과 같고 성별 검색을 한다. (ex. 여학생만 출력)
select stdnum,stdnm,substr(stdsec,1,6) birth,stdtel,stdste from stdinfo where stdgen='F' order by stdnm;
-- (2) 츨력 내용은 같고 30세 이상만 출력한다. -> 모르겠다.
create or replace function fn_jumin_year(v_jumin in varchar2)
    return number
is
    j1 varchar2(2);
    j2 varchar2(2);
    year varchar2(4);
    age number;
begin
    select substr(v_jumin,1,2) into j1 from dual;
    select decode(substr(v_jumin,8,1),'1','a','2','a','3','b','4','b')
        into j2 from dual;

    if j2='a' then
        year := '19'||j1;
    elsif j2 ='b' then
        year := '20'||j1;
    end if;

    age := to_char(sysdate)-year;
    return age;

end;
/

-- 3. (상세) 특정학생의 정보만 출력
-- *  이름, 주민등록번호, 연락처, 주소, 성별, 학력, 이메일, 상태*
select stdnm,rpad(substr(stdsec,1,7),14,'*') "주민등록번호",stdtel,stdadr,stdgen,stdscl,stdeml,stdste
from stdinfo
where stdnum = 20240714002;

-- 4. (수정) 특정학생의 정보를 변경한다.
-- * 홍길동의 연락처와 이메일을 변경한다. (변경내용은 임의로 설정)
update stdinfo set stdtel='010-7777-8888' where stdnum = 20240714001;
update stdinfo set stdeml='hong1234@google.com' where stdnum = 20240714001;

-- 5. (수정) 특정학생의 상태를 변경한다. (접수 -> 수강)
update stdinfo set stdste='수강' where stdnum = 20240714001;

-- 6. (삭제) 특정학생의 정보 전체를 삭제한다.
delete from stdinfo  where stdnum = 20240714001;

-- {상담정보}
-- 1. (학생정보출력) 기본출력 (번호, 이름, 상태, 최종상담일, 상담횟수)
select rownum "번호",
s.stdnm "이름",
s.stdste "상태",
(select max(cnsrdt)from cnsinfo where stdnum=s.stdnum) "최종상담일",
(select count(*) from cnsinfo where stdnum = s.stdnum) "상담회수"
from stdinfo s;

-- 2. (상세출력) - 이름 주민번호(801225_********), 연락처,과정,교육기간,상담회수

-- 2. (등록) 1~8번까지 등록하는 내용
-- (ex.홍길동 2회 상담)
-- 3. (수정) 상담내용, 조치사항, 날짜 를 수정처리 한다.
