package validador;
public class ValidarLongitud implements ValidadorContraseña {
    private int longitudMinima;
    private int longitudMaxima;

    public ValidarLongitud(int longitudMinima, int longitudMaxima) {
        this.longitudMinima = longitudMinima;
        this.longitudMaxima = longitudMaxima;
    }

    @Override
    public boolean validarContraseña(String contraseña) {
        return contraseña.length() >= longitudMinima && contraseña.length() <= longitudMaxima;
    }
}