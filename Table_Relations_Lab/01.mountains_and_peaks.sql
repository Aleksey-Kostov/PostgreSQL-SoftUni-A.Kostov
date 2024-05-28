CREATE TABLE mountains(
    id serial PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE peaks(
    id serial PRIMARY KEY,
    name varchar(50),
    mountain_id int, --REFERENCES mountains(id)
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)
          REFERENCES mountains(id)
);

-- ALTER TABLE peaks
-- ADD CONSTRAINT fk_peaks_mountains
--     FOREIGN KEY (mountain_id)
--         REFERENCES mountains(id);