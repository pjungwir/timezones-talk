!SLIDE

# Experiment: Postgres

Try it:

    @@@sql
    SET TIMEZONE='America/Los_Angeles'; SELECT NOW();
    SET TIMEZONE='America/Chicago';     SELECT NOW();

    SELECT '2016-04-04 20:45'::timestamptz;
    SELECT '2016-04-04 20:45'::timestamp;
    
    SELECT '2016-04-04 20:45 PDT'::timestamptz;
    SELECT '2016-04-04 20:45 PDT'::timestamp;



