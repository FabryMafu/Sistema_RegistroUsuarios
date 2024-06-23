package usuario;
import java.time.LocalDate;
import exportador.*;
import iniciosesion.*;
import validador.*;

public class Usuario {
    private String nombreUsuario;
    private String contraseña;
    private LocalDate ultimoCambioContraseña;
    private AdapterArchivo adapter;
    private AdminContraseña adminContraseña;
    private IntentoInicioSesion ultimoIntento;

    public Usuario(String nombreUsuario, AdminContraseña adminContraseña) {
        this.nombreUsuario = nombreUsuario;
        this.adminContraseña = adminContraseña;
        this.ultimoIntento = new IntentoInicioSesion(true); // Inicialmente permitir intentos
    }

    public void setContraseña(String nuevaContraseña) {
        if (adminContraseña.validarContraseña(nuevaContraseña)) {
            this.contraseña = nuevaContraseña;
            setUltimoCambioContraseña(LocalDate.now());
        } else {
            throw new IllegalArgumentException("Contraseña no válida");
        }
    }

    public void setUltimoCambioContraseña(LocalDate fecha) {
        this.ultimoCambioContraseña = fecha;
    }

    public boolean inicioSesion(String usuario, String contraseña) {
        if (!ultimoIntento.puedeIntentar()) {
            System.out.println("Debe esperar antes de intentar iniciar sesión nuevamente.");
            return false;
        }

        if (this.nombreUsuario.equals(usuario) && adminContraseña.compararHash(contraseña)) {
            ultimoIntento = new IntentoInicioSesion(true);
            adapter.mostrarContenido();
            return true;
        } else {
            ultimoIntento = new IntentoInicioSesion(false);
            return false;
        }
    }

    public static Usuario registroUsuario(String nombre, String contraseña, AdminContraseña adminContraseña) {
        Usuario usuario = new Usuario(nombre, adminContraseña);
        usuario.setContraseña(contraseña);
        return usuario;
    }

    // Método para obtener la contraseña
    public String getContraseña() {
        return this.contraseña;
    }

    // Método para obtener la fecha del último cambio de contraseña
    public LocalDate getUltimoCambioContraseña() {
        return this.ultimoCambioContraseña;
    }
}
