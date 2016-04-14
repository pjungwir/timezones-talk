!SLIDE

# Timezones in the database (Postgres)

    @@@asciidoc
    => select * from pg_timezone_names limit 10;
             name         | abbrev | utc_offset | is_dst 
    ----------------------+--------+------------+--------
     Singapore            | SGT    | 08:00:00   | f
     Turkey               | EEST   | 03:00:00   | t
     Pacific/Ponape       | PONT   | 11:00:00   | f
     Pacific/Palau        | PWT    | 09:00:00   | f
     Pacific/Tarawa       | GILT   | 12:00:00   | f
     Pacific/Efate        | VUT    | 11:00:00   | f
     Pacific/Port_Moresby | PGT    | 10:00:00   | f
     Pacific/Funafuti     | TVT    | 12:00:00   | f
     Pacific/Tongatapu    | TOT    | 13:00:00   | f
     Pacific/Rarotonga    | CKT    | -10:00:00  | f

