DROP TABLE IF EXISTS region CASCADE;
DROP TABLE IF EXISTS nation CASCADE;
DROP TABLE IF EXISTS supplier CASCADE;

create table region (
   r_regionkey int not null,
   r_name char(55) not null,
   r_comment char(152) not null,
   PRIMARY KEY ( r_regionkey )
);

create table nation (
   n_nationkey int not null,
   n_name char(25) not null,
   n_regionkey int not null,
   n_comment char(152) not null,
   PRIMARY KEY ( n_nationkey )
);

create table supplier (
   su_suppkey int not null,
   su_name char(25) not null,
   su_address varchar(40) not null,
   su_nationkey int not null,
   su_phone char(15) not null,
   su_acctbal numeric(12,2) not null,
   su_comment char(101) not null,
   PRIMARY KEY ( su_suppkey )
);
CREATE INDEX IDX_nation ON nation(n_regionkey) ;
CREATE INDEX IDX_region ON region(r_regionkey) ;
CREATE INDEX IDX_supplier ON supplier(su_nationkey) ;

ALTER TABLE nation  ADD CONSTRAINT FKEY_NATION_1 FOREIGN KEY(n_regionkey) REFERENCES region(r_regionkey) ON DELETE CASCADE;
ALTER TABLE supplier  ADD CONSTRAINT FKEY_SUPPLIER_1 FOREIGN KEY(su_nationkey) REFERENCES nation(n_nationkey) ON DELETE CASCADE;
