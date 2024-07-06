package exportador;

import org.junit.Before;
import org.junit.Test;
import validador.*;

import java.util.*;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class ValidacionContraTest {
    private AdminContraseña adminContraseña;
    private List<ValidadorContraseña> validadores;

    @Before
    public void setUp() {
        validadores = new ArrayList<>();
        validadores.add(new ValidarLongitud(8, 20));
        validadores.add(new ValidarCaracteres(Arrays.asList(" ")));
        validadores.add(new ValidarComplejidad(1, 1, 1));
        validadores.add(new ValidarPeoresContraseñas(new HashSet<>(Arrays.asList("123456", "password", "qwerty"))));
        validadores.add(new ValidarCredXDefecto(Arrays.asList("admin", "user", "test")));

        adminContraseña = new AdminContraseña(validadores);
    }

    @Test
    public void testContraseñaValida() {
        String contraseña = "Valid1@Password";
        boolean esValida = adminContraseña.validarContraseña(contraseña);

        assertTrue("La contraseña debería ser válida.", esValida);
    }

    @Test
    public void testContraseñaCorta() {
        String contraseña = "Short1!";
        boolean esValida = adminContraseña.validarContraseña(contraseña);

        if (!esValida) {
            System.out.println("La contraseña no es válida: Longitud insuficiente.");
        }
        assertFalse("La contraseña no debería ser válida.", esValida);
    }

    @Test
    public void testContraseñaSinSimbolos() {
        String contraseña = "NoSymbol1";
        boolean esValida = adminContraseña.validarContraseña(contraseña);

        if (!esValida) {
            System.out.println("La contraseña no es válida: Falta de símbolos.");
        }
        assertFalse("La contraseña no debería ser válida.", esValida);
    }

    @Test
    public void testContraseñaCaracteresProhibidos() {
        String contraseña = "Invalid Password1!";
        boolean esValida = adminContraseña.validarContraseña(contraseña);

        if (!esValida) {
            System.out.println("La contraseña no es válida: Contiene caracteres prohibidos.");
        }
        assertFalse("La contraseña no debería ser válida.", esValida);
    }

    @Test
    public void testContraseñaComunes() {
        String contraseña = "password";
        boolean esValida = adminContraseña.validarContraseña(contraseña);

        if (!esValida) {
            System.out.println("La contraseña no es válida: Es una contraseña común.");
        }
        assertFalse("La contraseña no debería ser válida.", esValida);
    }

    @Test
    public void testContraseñaDefault() {
        String contraseña = "admin";
        boolean esValida = adminContraseña.validarContraseña(contraseña);

        if (!esValida) {
            System.out.println("La contraseña no es válida: Es una credencial por defecto.");
        }
        assertFalse("La contraseña no debería ser válida.", esValida);
    }
}
