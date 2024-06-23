package validador;
import java.time.LocalDate;
import usuario.*;

public class ValidarUltimaRotacion implements ValidadorContraseña {
    private Usuario usuario;
    private int diasMaximos;

    public ValidarUltimaRotacion(Usuario usuario, int diasMaximos) {
        this.usuario = usuario;
        this.diasMaximos = diasMaximos;
    }

    @Override
    public boolean validarContraseña(String contraseña) {
        return LocalDate.now().minusDays(diasMaximos).isBefore(usuario.getUltimoCambioContraseña());
    }
}