package validador;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class AdminContraseña {
    private String contraseñaHasheada;
    private List<ValidadorContraseña> validadores;

    public AdminContraseña(List<ValidadorContraseña> validadores) {
        this.validadores = validadores;
    }

    public boolean validarContraseña(String contraseña) {
        for (ValidadorContraseña validador : validadores) {
            if (!validador.validarContraseña(contraseña)) {
                return false;
            }
        }
        setContraseñaHash(hashContraseña(contraseña));
        return true;
    }

    public void setContraseñaHash(String hash) {
        this.contraseñaHasheada = hash;
    }

    public boolean compararHash(String contraseña) {
        return hashContraseña(contraseña).equals(contraseñaHasheada);
    }

    private String hashContraseña(String contraseña) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedhash = digest.digest(contraseña.getBytes());
            return bytesToHex(encodedhash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    private static String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
