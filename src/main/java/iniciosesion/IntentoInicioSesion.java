package iniciosesion;
import java.time.LocalDateTime;

public class IntentoInicioSesion {
    private boolean intentoExitoso;
    private LocalDateTime fechaHoraIntento;
    private LocalDateTime proximoIntentoPermitido;
    private double tiempoRespuesta;

    public IntentoInicioSesion(boolean intentoExitoso) {
        this.intentoExitoso = intentoExitoso;
        this.fechaHoraIntento = LocalDateTime.now();
        if (!intentoExitoso) {
            limitarTiempoRespuesta();
        }
    }

    public void limitarTiempoRespuesta() {
        // Implementar lógica para limitar el tiempo de respuesta
        // Placeholder: agregar tiempo de espera entre intentos fallidos
        // this.tiempoRespuesta = 5.0; // Tiempo de espera de ejemplo
        this.proximoIntentoPermitido = LocalDateTime.now().plusSeconds((long) tiempoRespuesta);
    }

    public void setTiempoRespuesta(double tiempo) {
        this.tiempoRespuesta = tiempo;
    }

    public double getTiempoRespuesta() {
        return this.tiempoRespuesta;
    }

    public boolean puedeIntentar() {
        return LocalDateTime.now().isAfter(proximoIntentoPermitido);
    }

    public boolean getIntentoExitoso() {
        return this.intentoExitoso;
    }

    public LocalDateTime getFechaHoraIntento() {
        return this.fechaHoraIntento;
    }

}
