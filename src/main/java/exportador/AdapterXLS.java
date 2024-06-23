package exportador;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.apache.poi.ss.usermodel.*;

public class AdapterXLS implements AdapterArchivo {
    private AdaptadaXLS adaptadaXLS;

    public AdapterXLS(AdaptadaXLS adaptadaXLS) {
        this.adaptadaXLS = adaptadaXLS;
        verificarExtension();
    }

    private void verificarExtension() {
        String extension = adaptadaXLS.obtenerExtension();
        if (!"xls".equalsIgnoreCase(extension) && !"xlsx".equalsIgnoreCase(extension)) {
            throw new IllegalArgumentException("El archivo proporcionado no es un archivo XLS o XLSX.");
        }
    }

    @Override
    public List<Alumno> mostrarContenido() {
        List<Alumno> alumnos = new ArrayList<>();
        String path = adaptadaXLS.leerPath();

        try (FileInputStream fis = new FileInputStream(new File(path));
             Workbook workbook = WorkbookFactory.create(fis)) {
            Sheet sheet = workbook.getSheetAt(0);
            List<Row> rows = new ArrayList<>();
            for (Row row : sheet) {
                rows.add(row);
            }

            // Verificar que el archivo tenga al menos 3 filas
            if (rows.size() < 3) {
                throw new IllegalArgumentException("El archivo debe contener al menos 3 filas.");
            }

            // Seleccionar 3 filas aleatorias
            Collections.shuffle(rows);
            List<Row> randomRows = rows.subList(0, 3);

            // Convertir las filas seleccionadas en objetos Alumno
            for (Row row : randomRows) {
                Alumno alumno = new Alumno();
                alumno.setNombre(row.getCell(0).getStringCellValue());
                alumno.setApellido(row.getCell(1).getStringCellValue());
                alumno.setNombreMateria(row.getCell(2).getStringCellValue());
                alumno.setNota(row.getCell(3).getNumericCellValue());
                alumnos.add(alumno);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return alumnos;
    }
}
