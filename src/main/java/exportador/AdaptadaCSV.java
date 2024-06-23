package exportador;
public class AdaptadaCSV {
    private String path;

    public AdaptadaCSV(String path) {
        this.path = path;
    }

    public String leerPath() {
        return path;
    }
        public String obtenerExtension() {
        int i = path.lastIndexOf('.');
        if (i > 0) {
            return path.substring(i+1);
        } else {
            return "";
        }
    }
}
