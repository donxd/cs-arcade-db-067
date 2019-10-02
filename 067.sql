/*Please add ; after each select statement*/
CREATE PROCEDURE holidayEvent()
BEGIN
    SET @n = 0;
    SELECT
    buyer_name as winners
    FROM (
        SELECT
          (@n := @n + 1) as id
        , buyer_name
        FROM purchases
        ORDER BY timestamp ASC
    ) d1
    WHERE d1.id % 4 = 0
    GROUP BY d1.buyer_name
    ORDER BY winners ASC
    ;
END