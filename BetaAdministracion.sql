	Create database Beta;
	use Beta;
	
	SET GLOBAL lc_time_names = 'es_CL';
    
	create table Programa(
	cod_programa int auto_increment not null,
	nombre_programa varchar(50),
	primary key(cod_programa)
	);
    
    

	create table Cargo(
	cod_cargo int auto_increment not null,
	nombre_cargo varchar(50),
	primary key(cod_cargo)
	);



	create table Materia(
	cod_materia int auto_increment not null,
	nombre_materia varchar(50),
	primary key(cod_materia)
	);
    

	create table Estado(
    cod_estado int auto_increment not null,
    nombre_estado varchar(50),
    primary key(cod_estado)
    );
    

	create table  Persona(
	identificacion varchar(15) not null,
	nombre varchar(120),
	correo varchar(150),
	sexo varchar(1),
	programa int,
	cargo int,
	primary key(identificacion),
	constraint c1 foreign key (programa) references Programa(cod_programa),
	constraint c2 foreign key (cargo) references Cargo(cod_cargo)
	);

	ALTER TABLE Persona ADD INDEX (identificacion);



	create table Objeto(
	cod_objeto int auto_increment not null,
	codigo varchar (15),
	nombre varchar(120),
	modelo varchar(50),
	fecha_ingresoSistema timestamp,
	proveedor varchar(100),
	observacion varchar(200),
    estado int,
    constraint Obje1 foreign key (estado) references Estado(cod_estado),
	primary key(cod_objeto)
    
	);
	ALTER TABLE Objeto ADD INDEX (cod_objeto);
	ALTER TABLE Objeto ADD INDEX (codigo);


	Create table Agrupa(
    cod_Agrupa int auto_increment not null,
    nombre varchar(150) unique,
    primary key(cod_Agrupa) 
    );
    
    ALTER TABLE Agrupa ADD INDEX (cod_Agrupa );


	create table Reserva(
	indice int auto_increment not null,
	Fecha_dehecha timestamp,
	fecha_in datetime,
	fecha_out DATETIME,
	cant_Horas time,
	codigoPersona varchar(15),
	materia int,
	primary key(indice),
	constraint R1 foreign key (codigoPersona) references Persona(identificacion),
	constraint R2 foreign key (materia) references Materia(cod_materia)
	);

	ALTER TABLE Reserva ADD INDEX (indice);
	ALTER TABLE Reserva ADD INDEX (codigoPersona);



	create table ObjetosReserva(
	cod_Reserva int,
	codigoAgrupa int,
	constraint ObRe1 foreign key (codigoAgrupa) references Agrupa(cod_Agrupa),
	constraint ObRe2 foreign key (cod_Reserva) references Reserva(indice)
	);
    ALTER TABLE ObjetosReserva ADD INDEX (cod_Reserva);



	create table Asistencia(
	indice int auto_increment not null,
	fecha_in TIMESTAMP,
	fecha_out DATETIME,
	cant_Horas time,
	codigoPersona varchar(15),
	materia int,
	primary key(indice),
	constraint A1 foreign key (codigoPersona) references Persona(identificacion),
	constraint A2 foreign key (materia) references Materia(cod_materia)
	);

	ALTER TABLE Asistencia ADD INDEX (indice);
	ALTER TABLE Asistencia ADD INDEX (codigoPersona);




	create table ObjetosAsistencia(
	cod_Asistencia int,
	codigoAgrupa int,
	constraint ObAs1 foreign key (codigoAgrupa) references Agrupa(cod_Agrupa),
	constraint ObAs2 foreign key (cod_Asistencia) references Asistencia(indice)
	);
    ALTER TABLE ObjetosAsistencia ADD INDEX (cod_Asistencia);



	create table Gestores(
	codigo varchar(15) not null,
	nombre varchar(120),
	correo varchar(120),
	telefono varchar(15),
	contra varchar (100),
	cargo int,
	primary key(codigo),
	constraint G1 foreign key (cargo) references Cargo(cod_cargo)
	);

	ALTER TABLE Gestores ADD INDEX (codigo);



	create table registroTiempoGestores(
	cod_registro int auto_increment not null,
	codigo varchar(15),
	fecha_in datetime,
	fecha_out datetime,
	cantidad_horas time,
	actividad varchar(200),
	observaciones text,
	primary key(cod_registro),
	constraint rT1 foreign key (codigo) references  Gestores(codigo)
	);
    
	ALTER TABLE registroTiempoGestores ADD INDEX (codigo);



	create table Incidentes(
	cod_incidente int auto_increment not null,
	fecha timestamp,
	incident text,
	tipo varchar(20),
	primary key(cod_incidente)
	);



	create table Historial(
	cod_historial int auto_increment not null,
	fecha timestamp,
	quien varchar(40),
	tablaAfectada varchar(200),
	accion varchar(15),
	primary key(cod_historial)
	);



#procesos CRUD
			

	#  -------------TABLA PROGRAMA-------------------------
		DELIMITER $
		CREATE procedure `C_Programa`( nom varchar(50))  
		begin
		insert into Programa(nombre_programa) values (nom);
		END$

		DELIMITER $
		CREATE procedure `R_Programa`( cod int)  
		begin
		select * from Programa where cod_programa = cod ;
		END$

		DELIMITER $
		CREATE procedure `RT_Programa`()  
		begin
		select * from Programa;
		END$

		/* DELIMITER $
		CREATE procedure `U_programa`(campo varchar(50), valor varchar(50), compara int)  
		begin
		Update Programa set campo = valor where compara = Programa.nombre_programa ;
		END$*/

		DELIMITER $
		CREATE procedure `D_Programa`(val int)  
		begin
		delete from Programa where Programa.cod_programa = val ;
		END$



	#  -------------TABLA CARGO-------------------------
		DELIMITER $
		CREATE procedure `C_Cargo`( nom varchar(50))  
		begin
		insert into Cargo(nombre_cargo) values (nom);
		END$

		DELIMITER $
		CREATE procedure `R_Cargo`( cod int)  
		begin
		select * from Cargo where cod_cargo = cod ;
		END$

		DELIMITER $
		CREATE procedure `RT_Cargo`()  
		begin
		select * from Cargo;
		END$

		DELIMITER $
		CREATE procedure `D_Cargo`(val int)  
		begin
		delete from Cargo where Cargo.cod_cargo = val ;
		END$



	# -------------TABLA MATERIA-------------------------
		DELIMITER $
		CREATE procedure `C_Materia`( nom varchar(50))  
		begin
		insert into Materia(nombre_materia) values (nom);
		END$

		DELIMITER $
		CREATE procedure `R_Materia`( cod int)  
		begin
		select * from Materia where cod_materia = cod ;
		END$

		DELIMITER $
		CREATE procedure `RT_Materia`()  
		begin
		select * from Materia;
		END$

		DELIMITER $
		CREATE procedure `D_Materia`(val int)  
		begin
		delete from Materia where Materia.cod_materia = val ;
		END$



	# ------------***TABLA PERSONA-------------------------
		DELIMITER $
		CREATE procedure `C_Persona`(id varchar(15), nom varchar(120), corr varchar(150),se varchar(1), progra int, car int)  
		begin
		insert into Persona(identificacion,nombre,correo,sexo,programa,cargo) values (id,nom,corr,se,progra,car);
		END$

		DELIMITER $
		CREATE procedure `R_Persona`( cod varchar(15))  
		begin
		select * from Persona where identificacion = cod ;
		END$

		DELIMITER $
		CREATE procedure `RT_Persona`()  
		begin
		select * from Persona;
		END$

		DELIMITER $
		CREATE procedure `D_Persona`(val varchar(15) )  
		begin
		delete from Persona where Persona.identificacion = val ;
		END$
        
        

	# ------------***TABLA OBJETO-------------------------
		DELIMITER $
		CREATE procedure `C_Objeto`(id varchar(15), nom varchar(120), model varchar(50), provee varchar(100), obser varchar(200))  
		begin
		insert into Objeto(codigo,nombre,modelo,proveedor,observacion) values (id,nom,model,provee,obser);
		END$

		DELIMITER $
		CREATE procedure `R_Objeto`( cod varchar(120))  
		begin
		select * from Objeto where codigo = cod or nombre like concat('%',cod,'%') ;
		END$

		DELIMITER $
		CREATE procedure `RT_Objeto`()  
		begin
		select * from Objeto;
		END$

		DELIMITER $
		CREATE procedure `D_Objeto`(val varchar(15) )  
		begin
		delete from Objeto where codigo = val  ;
		END$



	#****************TABLA RESERVA *********************
		DELIMITER $
		CREATE procedure `C_Reserva`(star datetime, endd datetime,codPersona varchar(15), mate int)  
		begin
		insert into Reserva(fecha_in,fecha_out,codigoPersona,materia) values (star,endd,codPersona,mate);
		END$

		DELIMITER $
		CREATE procedure `R_Reserva`( cod int)  
		begin
		select * from Reserva where indice = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_Reserva`()  
		begin
		select * from Reserva;
		END$

		DELIMITER $
		CREATE procedure `D_Reserva`(val int)  
		begin
		delete from Reserva where indice = val;
		END$



	#****************TABLA ASISTENCIA *********************
		DELIMITER $
		CREATE procedure `C_Asistencia`(cant time,codPersona varchar(15), mate int)  
		begin
		insert into Asistencia(cant_Horas,codigoPersona, materia) values (cant,codPersona, mate);
		END$

		DELIMITER $
		CREATE procedure `R_Asistencia`( cod int)  
		begin
		select * from Asistencia where indice = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_Asistencia`()  
		begin
		select * from Asistencia;
		END$

		DELIMITER $
		CREATE procedure `D_Asistencia`(val int)  
		begin
		delete from Asistencia where indice = val;
		END$



	#****************TABLA GESTORES *********************
		DELIMITER $
		CREATE procedure `C_Gestores`(id varchar(15), nom varchar(120), corr varchar(120), tel varchar(15), car int, cont varchar(100))  
		begin
		insert into Gestores(codigo,nombre,correo,telefono,cargo,contra) values (id,nom,corr,tel,car,cont);
		END$

		DELIMITER $
		CREATE procedure `R_Gestores`( cod int)  
		begin
		select * from Gestores where codigo = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_Gestores`()  
		begin
		select * from Gestores;
		END$

		DELIMITER $
		CREATE procedure `D_Gestores`(val int)  
		begin
		delete from Gestores where codigo = val;
		END$



	#****************TABLA REGISTROTIEMPOGESTORES ********************
		DELIMITER $
		CREATE procedure `C_RegistroTGestores`(id varchar(15), fein datetime, feou datetime, act varchar(200), ob text)  
		begin
		insert into registroTiempoGestores(codigo,fecha_in,fecha_out,actividad,observaciones) values (id,fein,feou,act,ob);
		END$

		DELIMITER $
		CREATE procedure `R_RegistroTGestores`( cod varchar(15))  
		begin
		select * from registroTiempoGestores where codigo = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_RegistroTGestores`()  
		begin
		select * from registroTiempoGestores;
		END$

		DELIMITER $
		CREATE procedure `D_RegistroTGestores`(val varchar(15))  
		begin
		delete from registroTiempoGestores where cod_registro = val;
		END$



	#****************TABLA INCIDENTES *********************
		DELIMITER $
		CREATE procedure `C_Incidentes`(te text, ti varchar(20))  
		begin
		insert into Incidentes(incident,tipo) values (te,ti);
		END$

		DELIMITER $
		CREATE procedure `R_Incidentes`( cod int)  
		begin
		select * from Incidentes where codigo = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_Incidentes`()  
		begin
		select * from Incidentes;
		END$

		DELIMITER $
		CREATE procedure `D_Incidentes`(val int)  
		begin
		delete from Incidentes where codigo = val;
		END$



	#****************TABLA OBJETORESERVA *********************
		DELIMITER $
		CREATE procedure `C_ObjetosReserva`(coRes int, codObje int)  
		begin
		insert into ObjetosReserva(cod_Reserva,codigoAgrupa) values (coRes,codObje);
		END$

		DELIMITER $
		CREATE procedure `R_ObjetosReserva`( cod int)  
		begin
		select * from ObjetosReserva where cod_Reserva = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_ObjetosReserva`()  
		begin
		select * from ObjetosReserva;
		END$

		DELIMITER $
		CREATE procedure `D_ObjetosReserva`(val int)  
		begin
		delete from ObjetosReserva where cod_Reserva = val;
		END$




	#****************TABLA OBJETOASISTENCIA *********************
		DELIMITER $
		CREATE procedure `C_ObjetosAsistencia`(coAsis int, codObje int)  
		begin
		insert into ObjetosAsistencia(cod_Asistencia,codigoagrupa) values (coAsis,codObje);
		END$

		DELIMITER $
		CREATE procedure `R_ObjetosAsistencia`( cod int)  
		begin
		select * from ObjetosAsistencia where cod_Reserva = cod;
		END$

		DELIMITER $
		CREATE procedure `RT_ObjetosAsistencia`()  
		begin
		select * from ObjetosAsistencia;
		END$

		DELIMITER $
		CREATE procedure `D_ObjetosAsistencia`(val int)  
		begin
		delete from ObjetosAsistencia where cod_Asistencia = val;
		END$
       
       
       
       
       
#*********************TRIGGERS**************************************************************
		delimiter $
		create trigger TR_I_Reserva before insert on Reserva for each row 
		begin
		set NEW.cant_Horas = TIMEDIFF(NEW.fecha_out,NEW.fecha_in);
		end;$

		Delimiter $
		create  trigger TR_I_Asistencia before insert on Asistencia for each row 
		begin
		set NEW.fecha_out = ADDTIME(NOW(),NEW.cant_Horas);
		end;$

		




#################################auditoria##########################################################
	
    
    #------------Persona---------------
		Delimiter $
		Create  trigger TR_U_Persona
		before update  on Persona for each row
		begin
        if @identificador is null then
			set @identificador = current_user();
        end if;
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Persona','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_Persona
		before delete  on persona for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Persona','Delete');
		end;$



	#-----------objeto-----------------
		Delimiter $
		Create  trigger TR_I_Objeto
		before insert  on Objeto for each row
		begin
			IF new.codigo is null OR new.codigo =''   THEN
				set @x:= (SELECT MAX(cod_objeto) FROM objeto) + 1;
                
                IF @x is null then
					set @x =1;
                end if;
				
                set new.codigo = convert(@x, char(15));
                
			end if;
             
             IF new.estado is null Or new.estado = 0 then
             set new.estado = 1;             
             end if;
             
             IF not EXISTS(select nombre from objeto where objeto.nombre = new.nombre) then 
				Insert into Agrupa(nombre) value (new.nombre); 
             end if;
			
            insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Objeto','Insert');
           
		end;$

		Delimiter $
		Create  trigger TR_U_Objeto
		before update  on Objeto for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Objeto','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_Objeto
		before delete  on Objeto for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Objeto','Delete');
		end;$

#------------Agrega-----------------
		

	#------------programa-----------------
		Delimiter $
		Create  trigger TR_I_Programa
		before insert  on Programa for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Programa','Insert');
		end;$

		Delimiter $
		Create  trigger TR_U_Programa
		before update  on Programa for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Programa','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_Programa
		before delete  on Programa for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Programa','Delete');
		end;$



	#------------cargo-------------------------
		Delimiter $
		Create  trigger TR_I_Cargo
		before insert  on Cargo for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Cargo','Insert');
		end;$

		Delimiter $
		Create  trigger TR_U_Cargo
		before update  on Cargo for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Cargo','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_Cargo
		before delete  on Cargo for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Cargo','Delete');
		end;$



	#------------Materia-------------------
		Delimiter $
		Create  trigger TR_I_Materia
		before insert  on Materia for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Materia','Insert');
		end;$

		Delimiter $
		Create  trigger TR_U_Materia
		before update  on Materia for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Materia','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_Materia
		before delete  on Materia for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Materia','Delete');
		end;$



	#--------Gestores-----------------------
		Delimiter $
		Create  trigger TR_I_Gestores
		before insert  on Gestores for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Gestores','Insert');
		end;$

		Delimiter $
		Create  trigger TR_U_Gestores
		before update  on Gestores for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Gestores','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_Gestores
		before delete  on Gestores for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'Gestores','Delete');
		end;$



	#---------- reg. tiempo--------------------
		Delimiter $
		Create  trigger TR_I_registroTiempoGestores
		before insert  on registroTiempoGestores for each row
		begin
        set NEW.cantidad_horas = TIMEDIFF(NEW.fecha_out,NEW.fecha_in);
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'registroTiempoGestores','Insert');
		end;$

		Delimiter $
		Create  trigger TR_U_registroTiempoGestores
		before update  on registroTiempoGestores for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'registroTiempoGestores','Update');
		end;$

		Delimiter $
		Create  trigger TR_D_registroTiempoGestores
		before delete  on registroTiempoGestores for each row
		begin
		insert into Historial(quien,tablaAfectada,accion) values (@identificador,'registroTiempoGestores','Delete');
		end;$



	/*#-*-*-*-*-*usuario-*-*-*-*-*-*-*-*
	CREATE USER 'Usuarios'@'localhost' IDENTIFIED BY '147258369';
	GRANT insert ON  Beta.Persona TO 'Usuarios'@'localhost';
	GRANT insert ON  Beta.Reserva TO 'Usuarios'@'localhost';
	GRANT insert ON  Beta.Asistencia TO 'Usuarios'@'localhost';
	GRANT insert ON  Beta.objetosReserva TO 'Usuarios'@'localhost';
	GRANT insert ON  Beta.objetosAsistencia TO 'Usuarios'@'localhost';
	FLUSH PRIVILEGES;
    */
    
    
    
    ##########CONSULTAS,VISTAS,ESTADISTICAS###########################################################

		DELIMITER $
		CREATE procedure `HoraReserva`( )  	
		begin
		select fecha_in as start,fecha_out as end, nombre as title, CONCAT( correo,'<br>',CONCAT( Time(fecha_in) ,' - ', Time(fecha_out))) as descripcion from 
        Reserva inner join Persona on (Reserva.codigoPersona = Persona.identificacion) ;
		END$

		DELIMITER $
		Create or REPLACE view cantidadPersonasXCargo as 
        select Cargo.nombre_cargo,count(identificacion) as cantidad  from Persona inner join
        Cargo on(Persona.cargo = Cargo.cod_cargo) group by Cargo.nombre_cargo ;
        $
       
       DELIMITER $
        Create or REPLACE view promedioTiempoUsoAR as
        select CAST(AVG(Reserva.cant_Horas) as TIME) as HReserva , CAST(AVG(Asistencia.cant_Horas) as TIME) as HAsistencia from Reserva , Asistencia;
       $
      
      #cuantidad de uso por programa
      DELIMITER $
        Create procedure `cantUsoXPrograma` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
			if fechaIn is null OR fechaIn = '0' then
				call cantUsoXProgramaGeneral();
            else
             call cantUsoXProgramaParticular(fechaIn,fechaOut);
            end if;
        
        end$
        
      DELIMITER $
        Create procedure `cantUsoXProgramaParticular` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
         select nombrePrograma, Count(Uso) as usototal  from (
        
        select Programa.nombre_programa as nombrePrograma , Asistencia.indice as Uso from Programa
			left join Persona on ( Programa.cod_programa = Persona.programa) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
			where date(Asistencia.fecha_in) >= fechaIn  AND date(Asistencia.fecha_in) <= fechaOut
            
        union all
        
        select Programa.nombre_programa as nombrePrograma , Reserva.indice  as Uso from Programa
			left join Persona on ( Programa.cod_programa = Persona.programa) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
			where  date(Reserva.fecha_in) >= fechaIn   AND date(Reserva.fecha_in) <= fechaOut
		
        ) a group by nombrePrograma;
        end$
      
      DELIMITER $
        Create procedure `cantUsoXProgramaGeneral` ()
        Begin
         select nombrePrograma, Count(Uso) as usototal  from (
        
        select Programa.nombre_programa as nombrePrograma , Asistencia.indice as Uso from Programa
			left join Persona on ( Programa.cod_programa = Persona.programa) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
			
		
        union all
        
        select Programa.nombre_programa as nombrePrograma , Reserva.indice  as Uso from Programa
			left join Persona on ( Programa.cod_programa = Persona.programa) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
			
		
        ) a group by nombrePrograma;
        end$
       
       /* 
       DELIMITER $
        Create or REPLACE view cantUsoXPrograma as
        select Programa.nombre_programa , Count(Reserva.indice) + count(Asistencia.indice) as totalUsoXPrograma from Programa 
			left join Persona on ( Programa.cod_programa = Persona.programa) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
			group by (Programa.nombre_programa);
        $*/
        
        # uso por materias
        DELIMITER $
        Create procedure `cantUsoXMateria` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
			if fechaIn is null OR fechaIn = '0' then
				call cantUsoXMateriaGeneral();
            else
             call cantUsoXMateriaParticular(fechaIn,fechaOut);
            end if;
        
        end$
        
        DELIMITER $
        Create procedure `cantUsoXMateriaParticular` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
         select nombreMateria, Count(Uso) as usototal  from (
        
        select Materia.nombre_materia as nombreMateria , Asistencia.indice as Uso from Materia
		left join Asistencia on(Materia.cod_materia = Asistencia.materia) 
			where date(Asistencia.fecha_in) >= fechaIn  AND date(Asistencia.fecha_in) <= fechaOut
		
        union all
        
        select Materia.nombre_materia as nombreMateria , Reserva.indice  as Uso from Materia
			left join Reserva on(Materia.cod_materia = Reserva.materia) 
            where  date(Reserva.fecha_in) >= fechaIn   AND date(Reserva.fecha_in) <= fechaOut
			
        ) a group by nombreMateria;
        end$
        
        DELIMITER $
        Create procedure `cantUsoXMateriaGeneral` ()
        Begin
         select nombreMateria, Count(Uso) as usototal  from (
        
        select Materia.nombre_materia as nombreMateria , Asistencia.indice as Uso from Materia
			left join Asistencia on(Materia.cod_materia = Asistencia.materia) 
				
        union all
        
        select Materia.nombre_materia as nombreMateria , Reserva.indice  as Uso from Materia
			left join Reserva on(Materia.cod_materia = Reserva.materia) 
			
        ) a group by nombreMateria;
        end$
        
        /*DELIMITER $
        Create or REPLACE view cantUsoXMateria as
        select Materia.nombre_materia , Count(Reserva.indice) + count(Asistencia.indice) as totalUsoXMateria from Materia 
			left join Asistencia on(Materia.cod_materia = Asistencia.materia) 
			left join Reserva on(Materia.cod_materia = Reserva.materia) 
			group by (Materia.nombre_materia);
        $*/
        
       #cuantidad uso objetos
        DELIMITER $
        Create procedure `cantUsoObjetos` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
			if fechaIn is null OR fechaIn = '0' then
				call cantUsoObjetosGeneral();
            else
             call cantUsoObjetosParticular(fechaIn,fechaOut);
            end if;
        
        end$
        
        DELIMITER $
        Create procedure `cantUsoObjetosParticular` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
         select nombreObjeto, Count(Uso) as usototal  from (
        
        select Agrupa.nombre as  nombreObjeto , ObjetosAsistencia.cod_Asistencia as Uso from Agrupa
		left join ObjetosAsistencia on(Agrupa.cod_Agrupa = ObjetosAsistencia.codigoAgrupa) 
		left join Asistencia on(Asistencia.indice = ObjetosAsistencia.cod_Asistencia)
        where date(Asistencia.fecha_in) >= fechaIn  AND date(Asistencia.fecha_in) <= fechaOut
        
        union all
        
        select Agrupa.nombre as  nombreObjeto , ObjetosReserva.cod_Reserva  as Uso from Agrupa
		left join ObjetosReserva on(Agrupa.cod_Agrupa = ObjetosReserva.codigoAgrupa) 
        left join Reserva on (Reserva.indice = ObjetosReserva.cod_Reserva )
        where date(Reserva.fecha_in) >= fechaIn   AND date(Reserva.fecha_in) <= fechaOut
		
        ) a group by  nombreObjeto;
        end$
        
       DELIMITER $
        Create procedure `cantUsoObjetosGeneral` ()
        Begin
         select nombreObjeto, Count(Uso) as usototal  from (
        
        select Agrupa.nombre as  nombreObjeto , ObjetosAsistencia.cod_Asistencia as Uso from Agrupa
		left join ObjetosAsistencia on(Agrupa.cod_Agrupa = ObjetosAsistencia.codigoAgrupa) 
		
        union all
        
        select Agrupa.nombre as  nombreObjeto , ObjetosReserva.cod_Reserva  as Uso from Agrupa
		left join ObjetosReserva on(Agrupa.cod_Agrupa = ObjetosReserva.codigoAgrupa) 
		
        ) a group by  nombreObjeto;
        end$
       
       /*DELIMITER $
        Create or REPLACE view cantUsoObjetos as
        select Objeto.nombre , Count(ObjetosReserva.cod_Reserva) + count(ObjetosAsistencia.cod_Asistencia) as totalUsoObjeto from Objeto 
			left join ObjetosReserva on ( Objeto.cod_objeto = ObjetosReserva.codigoObjeto) 
			left join ObjetosAsistencia on(Objeto.cod_objeto = ObjetosAsistencia.codigoObjeto) 
			group by (Objeto.nombre);
        $*/
    
    #uso por cargo(estudiantes, profesores, visitantes etc..)
        DELIMITER $
        Create procedure `cantUsoXCargo` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
			if fechaIn is null OR fechaIn = '0' then
				call cantUsoXCargoGeneral();
            else
             call cantUsoXCargoParticular(fechaIn,fechaOut);
            end if;
        
        end$
	
         DELIMITER $
        Create procedure `cantUsoXCargoParticular` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
         select nombreCargo, Count(Uso) as usototal  from (
        
        select Cargo.nombre_cargo as nombreCargo , Asistencia.indice as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
            where date(Asistencia.fecha_in) >= fechaIn   AND date(Asistencia.fecha_in) <= fechaOut
		
        union all
        
        select Cargo.nombre_cargo as nombreCargo , Reserva.indice  as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
			where date(Reserva.fecha_in) >= fechaIn   AND date(Reserva.fecha_in) <= fechaOut
		
        ) a group by nombreCargo;
        end$
        
        DELIMITER $
        Create procedure `cantUsoXCargoGeneral` ()
        Begin
         select nombreCargo, Count(Uso) as usototal  from (
        
        select Cargo.nombre_cargo as nombreCargo , Asistencia.indice as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
		
        union all
        
        select Cargo.nombre_cargo as nombreCargo , Reserva.indice  as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
			
		
        ) a group by nombreCargo;
        end$
        
   /*	DELIMITER $
        Create or REPLACE view cantUsoXCargo as
         select Cargo.nombre_cargo , Count(Reserva.indice) + count(Asistencia.indice) as totalUsoXCargo from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
			group by ( Cargo.nombre_cargo);*/
		
        
        # uso por cada profesor
        DELIMITER $
        Create procedure `cantUsoXProfesor` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
			if fechaIn is null OR fechaIn = '0' then
				call cantUsoXProfesorGeneral();
            else
             call cantUsoXProfesorParticular(fechaIn,fechaOut);
            end if;
        
        end$
        
        DELIMITER $
        Create procedure `cantUsoXProfesorParticular` (fechaIn varchar(30),fechaOut varchar(30))
        Begin
         select nombreProfesor, Count(Uso) as usototal  from (
        
        select Persona.nombre as nombreProfesor , Asistencia.indice as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona)
            where Cargo.nombre_cargo = 'Profesor' AND date(Asistencia.fecha_in) >= fechaIn   AND date(Asistencia.fecha_in) <= fechaOut
			
        union all
        
        select Persona.nombre as nombreProfesor , Reserva.indice  as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
            where Cargo.nombre_cargo = 'Profesor' AND date(Reserva.fecha_in) >= fechaIn   AND date(Reserva.fecha_in) <= fechaOut
			
		
        ) a group by nombreProfesor;
        end$
        
        DELIMITER $
        Create procedure `cantUsoXProfesorGeneral` ()
        Begin
         select nombreProfesor, Count(Uso) as usototal  from (
        
        select Persona.nombre as nombreProfesor , Asistencia.indice as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona)
            where Cargo.nombre_cargo = 'Profesor'
			
        union all
        
        select Persona.nombre as nombreProfesor , Reserva.indice  as Uso from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
            where Cargo.nombre_cargo = 'Profesor'
		
        ) a group by nombreProfesor;
        end$
        
       /* DELIMITER $
        Create or REPLACE view cantUsoXProfesor as
         select Persona.nombre , Count(Reserva.indice) + count(Asistencia.indice) as totalUsoXProfesor from Cargo
			left join Persona on ( Cargo.cod_cargo = Persona.cargo) 
			left join Asistencia on(Persona.identificacion = Asistencia.codigoPersona) 
			left join Reserva on(Persona.identificacion = Reserva.codigoPersona) 
            where Cargo.nombre_cargo = 'Profesor'
			group by ( Persona.nombre);
        $*/
        
        
        #diario
        
        #semanal
        DELIMITER $
        Create procedure `cantUsoXYearMesSemana`(fecha varchar(30))
        Begin
			DECLARE Nsemana int;
			 if fecha is null OR fecha = '0' then
				set fecha = YEAR(NOW());
				set Nsemana = WEEK(NOW());
			 else
				 set Nsemana = WEEK(fecha);
				set fecha = YEAR(fecha);
			 end if;
             
			select yearr, Mes ,Dia,DiaSemana, Count(Uso) as usototal  from (
			
			select YEAR(Reserva.fecha_out) as yearr, MONTHNAME(Reserva.fecha_out) as Mes , DAY(Reserva.fecha_out)as Dia ,
			DAYNAME(Reserva.fecha_out) as DiaSemana, Reserva.indice as Uso  from Reserva 
            where YEAR(Reserva.fecha_out) = fecha AND WEEK(Reserva.fecha_out) = Nsemana
			
			union all
			
			select YEAR(Asistencia.fecha_out) as yearr, MONTHNAME(Asistencia.fecha_out) as Mes ,DAY(Asistencia.fecha_out)as Dia ,
			DAYNAME(Asistencia.fecha_out) as DiaSemana, Asistencia.indice as Uso from Asistencia
            where YEAR(Asistencia.fecha_out) = fecha AND WEEK(Asistencia.fecha_out) = Nsemana
			
			) a group by yearr,Mes,Dia;
        end$
        
        
        
        #mensual
        DELIMITER $
        CREATE PROCEDURE `cantUsoReservaXMes`(fecha varchar(30))
        BEGIN
         DECLARE fechaMes int;
		 if fecha is null OR fecha = '0' then
			set fecha = YEAR(NOW());
            set fechaMes = MONTH(NOW());
         else
			set fecha = YEAR(fecha);
            set fechaMes = MONTH(fecha);
         end if;
         
			select YEAR(Reserva.fecha_out) as yearr ,MONTHNAME(Reserva.fecha_out) as Mes , Count(Reserva.indice) as cantidadUso  from Reserva
            where YEAR(Reserva.fecha_out) = fecha AND MONTH(Reserva.fecha_out) = fechaMes
			group by YEAR(Reserva.fecha_out),MONTHNAME(Reserva.fecha_out);
        
        END$
        
        DELIMITER $
        CREATE PROCEDURE `cantUsoAsistenciaXMes`(fecha varchar(30))
        BEGIN
        DECLARE fechaMes int;
        if fecha is null OR fecha = '0' then
			set fecha = YEAR(NOW());
            set fechaMes = MONTH(NOW());
        else
			set fecha = YEAR(fecha);
            set fechaMes = MONTH(fecha);
        end if;
        
			select YEAR(Asistencia.fecha_out) as yearr,MONTHNAME(Asistencia.fecha_out) as Mes , Count(Asistencia.indice) as cantidadUso  from Asistencia
            where YEAR(Asistencia.fecha_out) = fecha AND MONTH(Asistencia.fecha_out) = fechaMes
			group by YEAR(Asistencia.fecha_out),MONTHNAME(Asistencia.fecha_out);
            
        END$
       
        
        #anual
        DELIMITER $
        Create procedure `cantUsoXYearMes` (fecha varchar(30))
        Begin
			if fecha is null OR fecha = '0' then
				set fecha = YEAR(NOW());
			 end if;
			
            select yearr, Mes ,nmes, usototal from (select yearr, Mes ,nmes, Count(Uso) as usototal from (
			
			select YEAR(Reserva.fecha_out) as yearr, MONTHNAME(Reserva.fecha_out) as Mes ,MONTH(Reserva.fecha_out) as nmes, Reserva.indice as Uso  from Reserva 
			where YEAR(Reserva.fecha_out) = fecha
			
			union all
			
			select YEAR(Asistencia.fecha_out) as yearr, MONTHNAME(Asistencia.fecha_out) as Mes , MONTH(Asistencia.fecha_out) as nmes, Asistencia.indice as Uso   from Asistencia 
			where YEAR(Asistencia.fecha_out) = fecha
			
			) a group by yearr,Mes) temp order by nmes ASC; 
        end$
        
       /* DELIMITER $
        Create procedure `cantUsoXYearMestemp` (fecha varchar(30))
        Begin
			if fecha is null OR fecha = '0' then
				set fecha = YEAR(NOW());
			 end if;
			 
			select yearr, Mes ,nmes, Count(Uso) as usototal from (
			
			select YEAR(Reserva.fecha_out) as yearr, MONTHNAME(Reserva.fecha_out) as Mes ,MONTH(Reserva.fecha_out) as nmes, Reserva.indice as Uso  from Reserva 
			where YEAR(Reserva.fecha_out) = fecha
			
			union all
			
			select YEAR(Asistencia.fecha_out) as yearr, MONTHNAME(Asistencia.fecha_out) as Mes , MONTH(Asistencia.fecha_out) as nmes, Asistencia.indice as Uso   from Asistencia 
			where YEAR(Asistencia.fecha_out) = fecha
			
			) a group by yearr,Mes;
        end$*/
        
        
        #Datos Predefinidos
        DELIMITER $
        INSERT into Cargo(nombre_cargo) values
        ('Estudiante'),
		('Profesor'),
		('Administrador'),
        ('Visitante'),
		('Monitor');
        $
        
        DELIMITER $
        INSERT into Estado(nombre_estado) 
        values ('Disponible'),
        ('Prestado'),
        ('Dado de baja'),
        ('Dañado');
        $
        
        DELIMITER $   
		INSERT Into Programa(nombre_programa) values 
        ('Ingeniería de Sistemas y Telecomunicaciones'),
		('Ingeniería Industrial'),
        ('Tecnologia en Desarrollo de software');
        $
        
        
        DELIMITER $
        INSERT into Materia(nombre_materia) values
        ('Circuitos y señales I'),
        ('Circuitos y señales II'),
        ('Telecomunicaciones I'),
        ('Telecomunicaciones II'),
        ('Telecomunicaciones III'),
        ('Procesamiento digital de Señales'),
        ('Redes de datos I'),
        ('Redes de datos II');
        $
        
        DELIMITER $
        INSERT into  Gestores(codigo,nombre,correo,	telefono,contra ,cargo ) 
        values ('12345','Admin','','','e40f01afbb1b9ae3dd6747ced5bca532','3');#contraseña 147258369 
        $
        
        DELIMITER $
        INSERT into Objeto(codigo,nombre) 
        values (123,'pc'),
        (143,'pc'),
        (124,'pcs'),
        (147,'obsiloscopio');
        $
        
        
        
        
     /* call cantUsoXYearMes(2020);
        
        drop Procedure if exists cantUsoXCargo;*/
        
        
        