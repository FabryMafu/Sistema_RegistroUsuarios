package exportador;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class AdapterArchivoTest {
    private Connection connection;

    @Before
    public void setUp() throws SQLException {
        // Establece la conexión a la base de datos
        String url = "jdbc:mysql://localhost:3306/testdb";
        String username = "root";
        String password = "password";
        connection = DriverManager.getConnection(url, username, password);

        // Crea la tabla si no existe
        String createTableQuery = "CREATE TABLE IF NOT EXISTS Alumno (" +
                "nombre VARCHAR(50), " +
                "apellido VARCHAR(50), " +
                "nombreMateria VARCHAR(50), " +
                "nota DOUBLE)";
        connection.createStatement().execute(createTableQuery);
    }

    @After
    public void tearDown() throws SQLException {
        // Cierra la conexión a la base de datos
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    @Test
    public void testMostrarContenidoYGuardarEnBaseDeDatos() {
        String fileType = System.getProperty("fileType"); // Obtenemos el tipo de archivo de las propiedades del sistema
        String filePath = "Sistema_RegistroUsuarios/tmp/index." + fileType;
        AdapterArchivo adapter = null;

        switch (fileType) {
            case "csv":
                AdaptadaCSV adaptadaCSV = new AdaptadaCSV(filePath);
                adapter = new AdapterCSV(adaptadaCSV);
                break;
            case "pdf":
                AdaptadaPDF adaptadaPDF = new AdaptadaPDF(filePath);
                adapter = new AdapterPDF(adaptadaPDF);
                break;
            case "xls":
                AdaptadaXLS adaptadaXLS = new AdaptadaXLS(filePath);
                adapter = new AdapterXLS(adaptadaXLS);
                break;
            default:
                throw new IllegalArgumentException("Tipo de archivo no soportado: " + fileType);
        }

        List<Alumno> alumnos = adapter.mostrarContenido();
        guardarAlumnosEnBaseDeDatos(alumnos);
    }

    private void guardarAlumnosEnBaseDeDatos(List<Alumno> alumnos) {
        String insertQuery = "INSERT INTO Alumno (nombre, apellido, nombreMateria, nota) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
            for (Alumno alumno : alumnos) {
                preparedStatement.setString(1, alumno.getNombre());
                preparedStatement.setString(2, alumno.getApellido());
                preparedStatement.setString(3, alumno.getNombreMateria());
                preparedStatement.setDouble(4, alumno.getNota());
                preparedStatement.addBatch();
            }
            preparedStatement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
