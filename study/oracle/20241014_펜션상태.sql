SELECT NVL('�Ϸ�','����') FROM DUAL WHERE '2024-10-14'<SYSDATE;

SELECT '�Ϸ�' FROM DUAL WHERE 1=1; -- �Ϸ� ���
SELECT '�Ϸ�' FROM DUAL; -- �Ϸ� ���

SELECT '�Ϸ�' FROM DUAL WHERE 1=2; -- ��� �ȵ�
SELECT NVL('�Ϸ�','����') FROM DUAL WHERE 1=2; -- ��� �ȵ�

SELECT MAX('�Ϸ�') FROM DUAL WHERE 1=2; -- NULL ���
SELECT NVL(MAX('�Ϸ�'),'����') FROM DUAL WHERE 1=2; -- NVL ��� :; ���� ���

SELECT '�Ϸ�' FROM DUAL WHERE 1=1; -- �Ϸ� ���
SELECT '�Ϸ�' FROM DUAL WHERE '2024-10-14'<SYSDATE; -- �Ϸ� ���

SELECT '�Ϸ�' FROM DUAL WHERE 1=2; -- ��� �ȵ�
SELECT '�Ϸ�' FROM DUAL WHERE '2024-10-17'<SYSDATE; -- ��� �ȵ�

SELECT NVL('�Ϸ�','����') FROM DUAL WHERE 1=2; -- ��� �ȵ�
SELECT NVL('�Ϸ�','����') FROM DUAL WHERE '2024-10-17'<SYSDATE; -- ��� �ȵ�

SELECT
(SELECT NVL('�Ϸ�','����') FROM DUAL WHERE '2024-10-17'<SYSDATE) "����"
FROM DUAL; -- NULL ���

SELECT
NVL((SELECT '�Ϸ�' FROM DUAL WHERE '2024-10-14'<SYSDATE),'����') "����"
FROM DUAL; -- NULL ���
