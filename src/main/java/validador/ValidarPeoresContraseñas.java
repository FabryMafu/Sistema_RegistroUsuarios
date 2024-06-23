package validador;
import java.util.Set;

public class ValidarPeoresContraseñas implements ValidadorContraseña {
    private Set<String> peoresContraseñas;

    public ValidarPeoresContraseñas(Set<String> peoresContraseñas) {
        this.peoresContraseñas = peoresContraseñas;
    }

    @Override
    public boolean validarContraseña(String contraseña) {
        return !peoresContraseñas.contains(contraseña);
    }
}