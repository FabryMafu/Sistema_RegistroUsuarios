package validador;
import java.util.List;

public class ValidarCaracteres implements ValidadorContraseña {
    private List<String> caracteresProhibidos;

    public ValidarCaracteres(List<String> caracteresProhibidos) {
        this.caracteresProhibidos = caracteresProhibidos;
    }

    @Override
    public boolean validarContraseña(String contraseña) {
        for (String caracter : caracteresProhibidos) {
            if (contraseña.contains(caracter)) {
                return false;
            }
        }
        return true;
    }
}




