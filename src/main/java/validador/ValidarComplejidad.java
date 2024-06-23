package validador;
public class ValidarComplejidad implements ValidadorContraseña {
    private int minimoLetras;
    private int minimoNumeros;
    private int minimoSimbolos;

    public ValidarComplejidad(int minimoLetras, int minimoNumeros, int minimoSimbolos) {
        this.minimoLetras = minimoLetras;
        this.minimoNumeros = minimoNumeros;
        this.minimoSimbolos = minimoSimbolos;
    }

    @Override
    public boolean validarContraseña(String contraseña) {
        int cuentaLetras = 0;
        int cuentaNumeros = 0;
        int cuentaSimbolos = 0;

        for (char c : contraseña.toCharArray()) {
            if (Character.isLetter(c)) {
                cuentaLetras++;
            } else if (Character.isDigit(c)) {
                cuentaNumeros++;
            } else if (isSimbolo(c)) {
                cuentaSimbolos++;
            }
        }

        return cuentaLetras >= minimoLetras && cuentaNumeros >= minimoNumeros && cuentaSimbolos >= minimoSimbolos;
    }

    private boolean isSimbolo(char c) {
        return !Character.isLetterOrDigit(c);
    }
}
