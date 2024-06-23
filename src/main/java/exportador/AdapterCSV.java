package exportador;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class AdapterCSV implements AdapterArchivo {
    private AdaptadaCSV adaptadaCSV;

    public AdapterCSV(AdaptadaCSV adaptadaCSV) {
        this.adaptadaCSV = adaptadaCSV;
        verificarExtension();
    }

    private void verificarExtension() {
        if (!"csv".equalsIgnoreCase(adaptadaCSV.obtenerExtension())) {
            throw new IllegalArgumentException("El archivo proporcionado no es un archivo CSV.");
        }
    }

    @Override
    public List<Alumno> mostrarContenido() {
        List<Alumno> alumnos = new ArrayList<>();
        String path = adaptadaCSV.leerPath();

        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            List<String> lines = new ArrayList<>();
            String line;
            while ((line = br.readLine()) != null) {
                lines.add(line);
            }

            // Verificar que el archivo tenga al menos 3 líneas
            if (lines.size() < 3) {
                throw new IllegalArgumentException("El archivo debe contener al menos 3 líneas.");
            }

            // Seleccionar 3 líneas aleatorias
            Collections.shuffle(lines);
            List<String> randomLines = lines.subList(0, 3);

            // Convertir las líneas seleccionadas en objetos Alumno
            for (String randomLine : randomLines) {
                String[] values = randomLine.split(",");
                Alumno alumno = new Alumno();
                alumno.setNombre(values[0]);
                alumno.setApellido(values[1]);
                alumno.setNombreMateria(values[2]);
                alumno.setNota(Double.parseDouble(values[3]));
                alumnos.add(alumno);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return alumnos;
    }
}
