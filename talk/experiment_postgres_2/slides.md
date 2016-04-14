!SLIDE

# Experiment: Postgres

    @@@sql
    DROP TABLE IF EXISTS t;

    CREATE TABLE t (
      id integer primary key,
      d1 timestamp without time zone,
      d2 timestamp with time zone
    );

    set timezone='UTC';
    INSERT INTO t VALUES
    (1, '2016-02-10 22:27:00', '2016-02-10 22:27:00'),
    (2, '2016-02-11 02:27:00', '2016-02-11 02:27:00'),
    (3, '2016-02-11 16:27:00', '2016-02-11 16:27:00');

    set timezone='America/Los_Angeles';
    INSERT INTO t VALUES
    (4, '2016-02-10 22:27:00', '2016-02-10 22:27:00'),
    (5, '2016-02-11 02:27:00', '2016-02-11 02:27:00'),
    (6, '2016-02-11 16:27:00', '2016-02-11 16:27:00');
