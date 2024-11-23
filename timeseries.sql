DROP TABLE IF EXISTS metrics;
CREATE TABLE metrics (
    series TEXT NOT NULL,
    t TIMESTAMP WITH TIME ZONE NOT NULL,
    gauge INT,
    PRIMARY KEY (t, series)
);

INSERT INTO metrics (SELECT 'requests',
                            g.t,
                            random(0, 100)
                       FROM generate_series(CURRENT_TIMESTAMP - INTERVAL '1 day',
                                            CURRENT_TIMESTAMP + INTERVAL '10 minutes',
                                            INTERVAL '15 seconds') as g(t));

UPDATE metrics
   SET gauge = gauge + 100
 WHERE t > CURRENT_TIMESTAMP + '1 minute'
   AND t <= CURRENT_TIMESTAMP + '5 minutes';