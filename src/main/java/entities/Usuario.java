package entities;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "usuario")
public class Usuario extends EntidadPersistente {
    @Column(name = "nombre_usuario")
    private String nombreUsuario;

    @Column(name = "contraseña")
    private String contraseña;

    @Column(name = "ultimo_cambio_contraseña")
    private LocalDate ultimoCambioContraseña;

    @OneToMany(mappedBy = "usuario", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Alumno> alumnos = new ArrayList<>();

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public LocalDate getUltimoCambioContraseña() {
        return ultimoCambioContraseña;
    }

    public void setUltimoCambioContraseña(LocalDate ultimoCambioContraseña) {
        this.ultimoCambioContraseña = ultimoCambioContraseña;
    }

    public List<Alumno> getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(List<Alumno> alumnos) {
        this.alumnos = alumnos;
    }
}
