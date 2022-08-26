create TABLE Board (
    id VARCHAR(20) PRIMARY key,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    inserted DATE DEFAULT SYSDATE
);

CREATE SEQUENCE auto START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;