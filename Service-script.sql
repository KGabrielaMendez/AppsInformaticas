/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     03/06/2018 20:14:46                          */
/*==============================================================*/


Create database systaxi
go
use systaxi
go

drop table if exists CAT_CARRERA;

drop table if exists CAT_COOPERATIVAS;

drop table if exists CAT_ENCOMIENDA;

drop table if exists CAT_PEDIDOS;

drop table if exists CAT_ROL;

drop table if exists CAT_UNIDADES;

drop table if exists CAT_USUARIOS;

drop table if exists LOGIN;

drop table if exists ROL_USER;

/*==============================================================*/
/* Table: CAT_CARRERA                                           */
/*==============================================================*/
create table CAT_CARRERA
(
   ID_CARRERA           int not null auto_increment,
   DESCRIPCION_CAR      varchar(1000),
   DISTANCIA_CAR        int,
   TIEMPOESPERAMIN_CAR  int,
   COSTO_CAR            decimal,
   LATITUD_CAR          decimal,
   LONGITUD_CAR         decimal,
   primary key (ID_CARRERA)
);

/*==============================================================*/
/* Table: CAT_COOPERATIVAS                                      */
/*==============================================================*/
create table CAT_COOPERATIVAS
(
   ID_COOP              int not null auto_increment,
   NOMBRE_COOP          varchar(150),
   CIUDAD_COOP          varchar(150),
   PAIS_COOP            varchar(150),
   NUNIDADES_COOP       int,
   FECHAREGISTRO_COOP   date,
   primary key (ID_COOP)
);

/*==============================================================*/
/* Table: CAT_ENCOMIENDA                                        */
/*==============================================================*/
create table CAT_ENCOMIENDA
(
   ID_ENCOMIENDA        int not null auto_increment,
   DESCRIPCION_ENC      varchar(1000),
   DISTANCIAMIN_ENC     int,
   TIEMPOESPERAMIN_ENC  int,
   PESOMAXKG_ENC        decimal,
   COSTOENC_MAX_ENC     decimal,
   LATITUD_ENC          decimal,
   LONGITUD_ENC         decimal,
   primary key (ID_ENCOMIENDA)
);

/*==============================================================*/
/* Table: CAT_PEDIDOS                                           */
/*==============================================================*/
create table CAT_PEDIDOS
(
   ID_PEDIDO            int not null auto_increment,
   ID_ROLUSER           int not null,
   ID_ENCOMIENDA        int,
   ID_CARRERA           int,
   primary key (ID_PEDIDO)
);

/*==============================================================*/
/* Table: CAT_ROL                                               */
/*==============================================================*/
create table CAT_ROL
(
   ID_ROL               INT not null auto_increment,
   DESCRIPCION          varchar(50),
   primary key (ID_ROL)
);

/*==============================================================*/
/* Table: CAT_UNIDADES                                          */
/*==============================================================*/
create table CAT_UNIDADES
(
   ID_UNI               int not null auto_increment,
   ID_COOP              int not null,
   PLACA_UNI            varchar(10),
   TIPO_UNI             varchar(4),
   MARCA_UNI            varchar(20),
   MODELO_UNI           varchar(70),
   ANIO_UNI             int,
   NUMERO_UNI           int,
   primary key (ID_UNI)
);

/*==============================================================*/
/* Table: CAT_USUARIOS                                          */
/*==============================================================*/
create table CAT_USUARIOS
(
   ID_US                int not null auto_increment,
   ID_LOG               INT not null,
   CEDULA_US            varchar(20),
   NOMBRE_US            varchar(70),
   APELLIDO_US          varchar(70),
   FECHANAC_US          date,
   CIUDAD_US            varchar(70),
   TELEFONO_US          varchar(10),
   GENERO_US            varchar(11) default 'OTRO',
   DIRECCION_US         varchar(100),
   FECHAREGISTRO_US     datetime,
   EMAIL_US             varchar(70),
   primary key (ID_US)
);

/*==============================================================*/
/* Table: LOGIN                                                 */
/*==============================================================*/
create table LOGIN
(
   ID_LOG               INT not null auto_increment,
   ID_ROL               INT not null,
   USERNAME             varchar(20),
   PASSWORD             varchar(25),
   primary key (ID_LOG)
);

/*==============================================================*/
/* Table: ROL_USER                                              */
/*==============================================================*/
create table ROL_USER
(
   ID_ROLUSER           int not null auto_increment,
   ID_US                int not null,
   ID_UNI               int,
   primary key (ID_ROLUSER)
);

alter table CAT_PEDIDOS add constraint FK_CARR_PEDIDO foreign key (ID_CARRERA)
      references CAT_CARRERA (ID_CARRERA) on delete restrict on update restrict;

alter table CAT_PEDIDOS add constraint FK_ENCOMIEN_PEDIDO foreign key (ID_ENCOMIENDA)
      references CAT_ENCOMIENDA (ID_ENCOMIENDA) on delete restrict on update restrict;

alter table CAT_PEDIDOS add constraint FK_ROLUSER_PEDIDO foreign key (ID_ROLUSER)
      references ROL_USER (ID_ROLUSER) on delete restrict on update restrict;

alter table CAT_UNIDADES add constraint FK_COOP_UNIDAD foreign key (ID_COOP)
      references CAT_COOPERATIVAS (ID_COOP) on delete restrict on update restrict;

alter table CAT_USUARIOS add constraint FK_LOGIN_USER foreign key (ID_LOG)
      references LOGIN (ID_LOG) on delete restrict on update restrict;

alter table LOGIN add constraint FK_ROL_LOGIN foreign key (ID_ROL)
      references CAT_ROL (ID_ROL) on delete restrict on update restrict;

alter table ROL_USER add constraint FK_UNIDAD_ROLUSER foreign key (ID_UNI)
      references CAT_UNIDADES (ID_UNI) on delete restrict on update restrict;

alter table ROL_USER add constraint FK_USUARIO_ROLUSER foreign key (ID_US)
      references CAT_USUARIOS (ID_US) on delete restrict on update restrict;

