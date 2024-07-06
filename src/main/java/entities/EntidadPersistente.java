package entities;

import javax.persistence.*;

@MappedSuperclass
public abstract class EntidadPersistente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    public int getId() {
        return id;
    }
}
