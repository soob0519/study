-- PRODUCT_TBL ���̺� ���� SQL
CREATE TABLE PRODUCT_TBL(
PRODUCT_ID NUMBER NOT NULL PRIMARY KEY,
PRODUCT_NAME VARCHAR2(20) NOT NULL,
PRODUCT_PRICE NUMBER,
PRODUCT_INFO VARCHAR2(2000),
PRODUCT_DATE DATE,
COMPANY VARCHAR2(50),
MANAGER_ID VARCHAR2(12)
);

-- SALE_TBL ���̺� ���� SQL
CREATE TABLE SALE_TBL(
SALE_SEQ NUMBER NOT NULL PRIMARY KEY,
SALE_DATE DATE,
PRODUCT_ID NUMBER,
SALE_QTY NUMBER,
SALE_PRICE NUMBER,
MEMBER_ID VARCHAR2(12)
);

