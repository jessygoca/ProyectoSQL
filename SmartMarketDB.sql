--Proyecto Smart Market 

Create Database SmartMarketDB

USE SmartMarketDB

--Crear tabla Proveedor
Create Table Proveedor (
IdProveedor Int Primary Key Identity(1,1),
Nombre Varchar(100) Not Null,
Direccion Varchar(100) Not Null,
Telefono Varchar(20) Not Null,
Email Varchar(100) Unique Not Null,
ContactoPrincipal Varchar(100) Not Null
);


--Crear tabla Compra
Create Table Compra (
IdCompra Int Primary Key Identity(1,1),
FechaCompra DATE Not Null,
Cantidad INT Not Null,
FK_IdProveedor int Not null,
Foreign Key(FK_IdProveedor) References Proveedor(IdProveedor)
);

--Crear tabla Categoria
Create Table Categoria (
IdCategoria Int Primary Key Identity(1,1),
Nombre Varchar(100) Not Null,
);

--Crear tabla Producto
Create Table Producto (
IdProducto Int Primary Key Identity(1,1),
Nombre Varchar(100) Not Null,
Descripcion Varchar(250) Not Null,
PrecioProducto INT Not Null,
CantidadStock INT Not Null,
FK_IdCategoria int Not null,
Foreign Key(FK_IdCategoria) References Categoria(IdCategoria)
);

--Crear tabla Suministrar
Create Table Suministrar (
IdSuministro Int Primary Key Identity(1,1),
FK_IdProveedor int Not null,
FK_IdProducto int Not null,
Foreign Key(FK_IdProveedor) References Proveedor(IdProveedor),
Foreign Key(FK_IdProducto) References Producto(IdProducto)
);

--Crear tabla Cliente
Create Table Cliente (
IdCliente Int Primary Key Identity(1,1),
Nombre Varchar(100) Not Null,
Direccion Varchar(100) Not Null,
Telefono Varchar(20) Not Null,
Email Varchar(100) Unique Not Null,
);

--Crear tabla Venta
Create Table Venta (
IdVenta Int Primary Key Identity(1,1),
fechaVenta DATE Not Null,
FK_IdCliente int Not null,
Foreign Key(FK_IdCliente) References Cliente(IdCliente)
);

--Crear tabla Tipo
Create Table Tipo (
IdTipo Int Primary Key Identity(1,1),
Tipo Varchar(20) Not Null,
);


--Crear tabla Transaccion
Create Table Transaccion (
IdTransaccion Int Primary Key Identity(1,1),
CostoCompra INT Not Null,
Cantidad INT Not Null,
PrecioVenta INT Not Null,
FK_IdVenta int Not null,
FK_IdTipo int Not null,
FK_IdProducto int Not null,
FK_IdCompra int Not null,
Foreign Key(FK_IdVenta) References Venta(IdVenta),
Foreign Key(FK_IdTipo) References Tipo(IdTipo),
Foreign Key(FK_IdProducto) References Producto(IdProducto),
Foreign Key(FK_IdCompra) References Compra(IdCompra),
);