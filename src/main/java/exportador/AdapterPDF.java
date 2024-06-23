package exportador;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.io.File;
import java.io.IOException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

public class AdapterPDF implements AdapterArchivo {
    private AdaptadaPDF adaptadaPDF;

    public AdapterPDF(AdaptadaPDF adaptadaPDF) {
        this.adaptadaPDF = adaptadaPDF;
        verificarExtension();
    }

    private void verificarExtension() {
        if (!"pdf".equalsIgnoreCase(adaptadaPDF.obtenerExtension())) {
            throw new IllegalArgumentException("El archivo proporcionado no es un archivo PDF.");
        }
    }

    @Override
    public List<Alumno> mostrarContenido() {
        List<Alumno> alumnos = new ArrayList<>();
        String path = adaptadaPDF.leerPath();

        try (PDDocument document = PDDocument.load(new File(path))) {
            PDFTextStripper pdfStripper = new PDFTextStripper();
            String text = pdfStripper.getText(document);
            String[] lines = text.split("\n");

            // Verificar que el archivo tenga al menos 3 líneas
            if (lines.length < 3) {
                throw new IllegalArgumentException("El archivo debe contener al menos 3 líneas.");
            }

            // Seleccionar 3 líneas aleatorias
            List<String> linesList = new ArrayList<>();
            Collections.addAll(linesList, lines);
            Collections.shuffle(linesList);
            List<String> randomLines = linesList.subList(0, 3);

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
