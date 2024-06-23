package exportador;
public class AdaptadaPDF {
    private String path;

    public AdaptadaPDF(String path) {
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
