
CREATE DATABASE dbCRM

USE dbCRM


CREATE TABLE tbEstados(
estaCodigo int not null primary key IDENTITY (1, 1),
estaDescripcion varchar(50) null
)


CREATE TABLE tbUsuarios(
usuaCodigo int not null primary key,
usuaDescripcion varchar(50) null,
usuaLogin varchar(50) null,
usuaPassword varchar(50) null,
estaCodigo int null
)

ALTER TABLE tbUsuarios
ADD CONSTRAINT fk_usuarios
FOREIGN KEY (estaCodigo) REFERENCES tbEstados(estaCodigo);



Create procedure spInsertarUsuarios

@cLogin VARCHAR(50),
@cPassword VARCHAR(50)

AS

IF NOT EXISTS(SELECT 1 FROM [dbo].[tbUsuarios] WHERE [usuaLogin] =@cLogin)

BEGIN
	DECLARE @nCodigo INT =
	(SELECT COALESCE(MAX(usuaCodigo),0) + 1 
	FROM [dbo].[tbUsuarios]);

	INSERT INTO [dbo].[tbUsuarios]
	(
	usuaCodigo,
	usuaLogin,
	usuaPassword,
	estaCodigo
	)
	VALUES(
	@nCodigo,
	@cLogin,
	@cPassword,
	1
	);
END

--------------------------

Create procedure spConsultarUsuario

@cLogin VARCHAR(50),
@cPassword VARCHAR(50)

AS

SELECT [usuaCodigo],[usuaDescripcion],[usuaLogin],[usuaPassword],[estaCodigo]
FROM [dbo].[tbUsuarios]
WHERE [usuaLogin] = @cLogin  AND
[usuaPassword] = @cPassword AND [estaCodigo] = 1;