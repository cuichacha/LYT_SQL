select k3.ROLENAME, k2.count
from (select k1.ROLEINFO, count(1) as count
      from KEYUNIT_VISITOR k1
      where k1.CREATEDATE >= to_date('2019-01-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and k1.CREATEDATE <= to_date('2021-09-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
        and ROLEINFO = ''
      group by k1.ROLEINFO) k2
         left join KEYUNIT_VISITOR k3 on k2.ROLEINFO = k3.ROLEINFO;

select count(1)
from KEYUNIT_VISITOR
where STATUS = '1';

select count(1)
from KEYUNIT_VISITOR
where CREATEDATE <= sysdate
  and CREATEDATE >= to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss');

select count(1)
from KEYUNIT_VISITOR
where trunc(CREATEDATE) = trunc(sysdate);

select count(1) as count, to_char(trunc(CREATEDATE), 'yyyy-mm-dd') as day
from KEYUNIT_VISITOR
group by trunc(CREATEDATE);



select (select cnt from CODEDETAIL c where c.ID = a.GENDERCODE and c.TYPEID = 'GenderCode')      as gender,
       (select cnt from CODEDETAIL c where c.ID = a.KEYUNITID and c.TYPEID = 'KeyUnitAlarmType') as keyUnitAlarmType,
       r.ROLENAME,
       a.ID,
       a.KEYUNITID,
       a.NAME,
       a.CERTIFICATE,
       a.GENDERCODE,
       a.ADDRESS,
       a.ALARMTYPE,
       a.CERTIFICATEPHOTO,
       a.PHOTO,
       a.SIMILARITY,
       a.PERSONMINORCATEGORIES,
       a.CREATEDATE,
       a.AREACODE,
       a.AREANAME,
       a.POLICE,
       a.UPLOADDATE,
       a.UPLOADSTATUS,
       a.UPLOADMSG,
       a.ISDEAL,
       a.DEALNOTES,
       a.CREATETOR
from KEYUNIT_ALARM a
         left join ROLEINFO r on a.KEYUNITID = r.ROLEID
where a.CREATEDATE >= ''
  and a.CREATEDATE <= ''
  and a.KEYUNITID = ''
  and a.GENDERCODE = ''
  and a.CERTIFICATE = ''
  and a.NAME like '';


select *
from (select to_char(GXSJ, 'yyyy-mm-dd hh24:mi:ss') as time
      from ZCGL_DEVICE
      order by GXSJ asc)
where ROWNUM = 1;

select SBBM
from ZCGL_DEVICE
where GXSJ >= to_date('2021-07-05 14:03:58', 'yyyy-mm-dd hh24:mi:ss');

select a.HONOR, a.MEMO, a.id as honorid, b.*, (select c.NAME from SCOUTROOM c where b.ROOMID = c.ID) as room_txt
from scoutroom_person_honor a
         left join SCOUTROOM_PERSON b on a.PERSONID = b.ID
where 1 = 1
order by b.usernumber;

select count(*)
from ZCGL_DEVICE_SOURCE
where length(substr(to_char(JD), instr(to_char(JD), '.') + 1)) < 6
   or length(substr(to_char(WD), instr(to_char(WD), '.') + 1)) < 6;

update ZCGL_DEVICE_SOURCE
set ASSERTSTATUS = null;
update ZCGL_DEVICE_SOURCE
set CREATETIME = sysdate;

select SBBM,
       SBMC,
       JKDWLX,
       MACDZ,
       IP,
       SXJGNLX,
       JD,
       WD,
       SXJCJQY,
       SBZT,
       UPLOADUSER
from ZCGL_DEVICE_SOURCE
where ASSERTSTATUS is null
order by CREATETIME asc;

update SMS_AUTH set AUTHTIME = sysdate where ID = '31';

select JD, WD
from ZCGL_DEVICE_SOURCE;

delete
from ZCGL_DEVICE_SOURCE;
delete
from ZCGL_DEVICE;

select count(*)
from ZCGL_DEVICE_SOURCE
where ASSERTSTATUS = null;

select *
from ZCGL_DEVICE_SOURCE
where IP = '61.7.30.66';

select id, phone from sms_auth;