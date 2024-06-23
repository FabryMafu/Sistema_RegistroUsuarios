CREATE DATABASE
Validacion;
use Validacion;

CREATE TABLE Usuario (
id_usuario INTEGER PRIMARY KEY auto_increment,
nombreUsuario VARCHAR (45) DEFAULT NULL,
contraseña VARCHAR (64) DEFAULT NULL,
ultimoCambioContraseña DATE DEFAULT NULL);


CREATE TABLE IntentoInicioSesion (
id_intento INTEGER PRIMARY KEY auto_increment,
intentoExitoso BOOLEAN DEFAULT NULL,
fechaIntento DATE DEFAULT NULL,
horaIntento TIME DEFAULT NULL,
tiempoRespuesta DOUBLE DEFAULT NULL,
id_usuario integer,
FOREIGN KEY  (id_usuario) REFERENCES Usuario (id_usuario))
;
CREATE TABLE Alumno (
id_alumno INTEGER PRIMARY KEY auto_increment,
nombre VARCHAR (50) DEFAULT NULL,
apellido VARCHAR (50) DEFAULT NULL,
nombreMateria VARCHAR (50) DEFAULT NULL,
nota DOUBLE DEFAULT NULL );

CREATE TABLE AdapterArchivo (
id_adapterArchivo INTEGER PRIMARY KEY auto_increment,
nombreAdapter VARCHAR (50) DEFAULT NULL,
rutaArchivo VARCHAR (255) DEFAULT NULL,
id_alumno integer,
id_usuario integer,
FOREIGN KEY  (id_alumno) REFERENCES Alumno (id_alumno),
FOREIGN KEY  (id_usuario) REFERENCES Usuario (id_usuario));

CREATE TABLE validadorContraseña (
id_validadorContraseña INTEGER PRIMARY KEY auto_increment,
nombreValidacion VARCHAR (50) DEFAULT NULL,
id_usuario integer,
FOREIGN KEY  (id_usuario) REFERENCES usuario (id_usuario)
)
;

CREATE TABLE AdminContraseña (
id_adminContraseña INTEGER PRIMARY KEY auto_increment,
contraseñahasheada VARCHAR (100) DEFAULT NULL,
id_validadorContraseña integer,
id_usuario integer,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña),
FOREIGN KEY  (id_usuario) REFERENCES usuario (id_usuario)
)
;


CREATE TABLE validacionPeores(
id_validacionPeores INTEGER PRIMARY KEY auto_increment,
peoresContrasenas TEXT DEFAULT NULL,
id_validadorContraseña integer,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña)
)
;

CREATE TABLE validacionLongitud(
id_validacionLongitud INTEGER PRIMARY KEY auto_increment,
longitudMinima integer DEFAULT NULL,
longitudMaxima integer DEFAULT NULL,
id_validadorContraseña integer,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña)
);

CREATE TABLE credencialesXDefecto(
id_credencialesXDefecto INTEGER PRIMARY KEY auto_increment,
credencialesXDefecto TEXT DEFAULT NULL,
id_validadorContraseña integer,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña)
);

CREATE TABLE validacionCaracteres(
id_validacionCaracteres INTEGER PRIMARY KEY auto_increment,
caracteresProhibidos TEXT DEFAULT NULL,
id_validadorContraseña integer,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña)
);
CREATE TABLE validacionUltimaRotacion(
id_validacionRotacion INTEGER PRIMARY KEY auto_increment,
diasMaximos INT DEFAULT NULL,
id_validadorContraseña integer,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña)
);
CREATE TABLE validacionComplejidad(
id_validacionComplejidad INTEGER PRIMARY KEY auto_increment,
id_validadorContraseña integer,
minimoNumeros INT default null,
minimoSimbolos INT default null,
minimoMinuscula INT default null,
minimoMayuscula INT default null,
FOREIGN KEY  (id_validadorContraseña) REFERENCES validadorContraseña (id_validadorContraseña)
);
