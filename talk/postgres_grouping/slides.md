!SLIDE

# Postgres: GROUP BY

    @@@sql
    SELECT * FROM sales ORDER BY sold_at;
           sold_at       | price_cents 
    ---------------------+-------------
     2016-02-10 22:27:00 |        2000
     2016-02-11 02:27:00 |        2000
     2016-02-11 16:27:00 |        2000


    SELECT date_trunc('day', sold_at) d,
            sum(price_cents)
    FROM   sales
    GROUP BY d
    ORDER BY d;
              d          | sum  
    ---------------------+------
     2016-02-10 00:00:00 | 2000
     2016-02-11 00:00:00 | 4000


