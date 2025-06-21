CREATE TABLE IF NOT EXISTS bus_location (
        id SERIAL PRIMARY KEY,
        ordem TEXT NOT NULL,
        linha TEXT,
        velocidade DOUBLE PRECISION,
        localizacao GEOMETRY(Point, 4326),
        datahora TIMESTAMP,
        datahoraenvio TIMESTAMP,
        datahoraservidor TIMESTAMP
    );