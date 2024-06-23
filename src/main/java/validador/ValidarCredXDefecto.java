package validador;
import java.util.List;

public class ValidarCredXDefecto implements ValidadorContraseña {
    private List<String> credencialesXDefecto;

    public ValidarCredXDefecto(List<String> credencialesXDefecto) {
        this.credencialesXDefecto = credencialesXDefecto;
    }

    @Override
    public boolean validarContraseña(String contraseña) {
        return !credencialesXDefecto.contains(contraseña);
    }
}