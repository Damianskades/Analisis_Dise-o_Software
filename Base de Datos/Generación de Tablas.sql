CREATE TABLE [Bloqueo]( 
[Id_bloqueo]         char(11)  NOT NULL ,
[blo_fecha]          DATETIME  NOT NULL ,
[blo_motivo]        varchar(50)  NOT NULL ,
[Id_usuario]        char(10)  NOT NULL )
go

CREATE TABLE [Calificacion]( 
[Id_calificacion]    char(10)  NOT NULL ,
[cal_fecha]          DATETIME  NOT NULL ,
[cal_comentario]     varchar(50)  NULL ,
[cal_estrellas]      integer  NOT NULL ,
[Id_usuario]         char(10)  NOT NULL )
go

CREATE TABLE [Notificacion]( 
[Id_notificacion]    char(12)  NOT NULL ,
[not_tipo]           varchar(50)  NULL ,
[not_mensaje]        varchar(60)  NOT NULL ,
[not_fecha]          DATETIME  NOT NULL ,
[Id_solicitud]       char(11)  NOT NULL ,
[Id_reporte]         char(10)  NOT NULL ,
[Id_usuario]         char(10)  NOT NULL )
go

CREATE TABLE [Producto]( 
[Id_producto]        char(10)  NOT NULL ,
[pro_nombre]         varchar(50)  NOT NULL ,
[pro_tipo]           varchar(50)  NOT NULL ,
[pro_fechaInicio]    DATETIME  NOT NULL ,
[pro_cantidad]       integer  NOT NULL ,
[pro_estado]         char(2)  NOT NULL )
go

CREATE TABLE [Reporte]( 
[Id_reporte]         char(10)  NOT NULL ,
[repor_fecha]        DATETIME  NOT NULL ,
[repor_beneficios]   integer  NOT NULL ,
[repor_donaciones]   integer  NOT NULL ,
[repor_intercambios] integer  NOT NULL )
go

CREATE TABLE [Solicitud]( 
[Id_solicitud]       char(11)  NOT NULL ,
[soli_estado]        char(2)  NOT NULL ,
[soli_cantidad]      integer  NOT NULL ,
[soli_fecha]         DATETIME  NOT NULL ,
[soli_tipo]          varchar(60)  NULL ,
[Id_reporte]         char(10)  NOT NULL ,
[Id_usuario]         char(10)  NOT NULL )
go

CREATE TABLE [Solicitud_Producto]( 
[Id_solicitud]       char(11)  NOT NULL ,
[Id_reporte]         char(10)  NOT NULL ,
[Id_producto]        char(10)  NOT NULL ,
[Id_usuario]         char(10)  NOT NULL )
go

CREATE TABLE [Usuario]( 
[Id_usuario]         char(10)  NOT NULL ,
[usu_tipo]           varchar(50)  NOT NULL ,
[usu_email]          varchar(50)  NOT NULL ,
[usu_telefono]       char(9)  NOT NULL ,
[usu_password]       varchar(50)  NOT NULL ,
[usu_nomrbe]         varchar(50)  NOT NULL ,
[usu_direccion]      varchar(50)  NOT NULL )
go

ALTER TABLE [Bloqueo]
ADD CONSTRAINT [XPKBloqueo] PRIMARY KEY  CLUSTERED ([Id_bloqueo] ASC,[Id_usuario] ASC)
go

ALTER TABLE [Calificacion]
ADD CONSTRAINT [XPKCalificacion] PRIMARY KEY  CLUSTERED ([Id_calificacion] ASC,[Id_usuario] ASC)
go

ALTER TABLE [Notificacion]
ADD CONSTRAINT [XPKNotificacion] PRIMARY KEY  CLUSTERED ([Id_notificacion] ASC,[Id_solicitud] ASC,[Id_reporte] ASC,[Id_usuario] ASC)
go

ALTER TABLE [Producto]
ADD CONSTRAINT [XPKProducto] PRIMARY KEY  CLUSTERED ([Id_producto] ASC)
go

ALTER TABLE [Reporte]
ADD CONSTRAINT [XPKReporte] PRIMARY KEY  CLUSTERED ([Id_reporte] ASC)
go

ALTER TABLE [Solicitud]
ADD CONSTRAINT [XPKSolicitud] PRIMARY KEY  CLUSTERED ([Id_solicitud] ASC,[Id_reporte] ASC,[Id_usuario] ASC)
go

ALTER TABLE [Solicitud_Producto]
ADD CONSTRAINT [XPKSolicitud_Producto] PRIMARY KEY  CLUSTERED ([Id_solicitud] ASC,[Id_reporte] ASC,[Id_producto] ASC,[Id_usuario] ASC)
go

ALTER TABLE [Usuario]
ADD CONSTRAINT [XPKUsuario] PRIMARY KEY  CLUSTERED ([Id_usuario] ASC)
go

ALTER TABLE [Bloqueo]
ADD CONSTRAINT [R_7] FOREIGN KEY ([Id_usuario]) REFERENCES [Usuario]([Id_usuario])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go

ALTER TABLE [Calificacion]
ADD CONSTRAINT [R_8] FOREIGN KEY ([Id_usuario]) REFERENCES [Usuario]([Id_usuario])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go

ALTER TABLE [Notificacion]
ADD CONSTRAINT [R_2] FOREIGN KEY ([Id_solicitud],[Id_reporte],[Id_usuario]) REFERENCES [Solicitud]([Id_solicitud],[Id_reporte],[Id_usuario])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go

ALTER TABLE [Solicitud]
ADD CONSTRAINT [R_1] FOREIGN KEY ([Id_reporte]) REFERENCES [Reporte]([Id_reporte])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go

ALTER TABLE [Solicitud]
ADD CONSTRAINT [R_6] FOREIGN KEY ([Id_usuario]) REFERENCES [Usuario]([Id_usuario])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go

ALTER TABLE [Solicitud_Producto]
ADD CONSTRAINT [R_4] FOREIGN KEY ([Id_solicitud],[Id_reporte],[Id_usuario]) REFERENCES [Solicitud]([Id_solicitud],[Id_reporte],[Id_usuario])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go

ALTER TABLE [Solicitud_Producto]
ADD CONSTRAINT [R_5] FOREIGN KEY ([Id_producto]) REFERENCES [Producto]([Id_producto])
ON DELETE NO ACTION
ON UPDATE NO ACTION
go
