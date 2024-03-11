/* Write your T-SQL query statement below */
WITH TopUser AS (
    SELECT TOP 1 
        u.name AS name1, 
        COUNT(*) AS rating_count
    FROM 
        MovieRating mr
    INNER JOIN 
        users u ON u.user_id = mr.user_id
    GROUP BY 
        u.name
    ORDER BY 
        rating_count DESC, 
        name1 ASC
),
MovieRatings AS (
    SELECT TOP 1
        m.title, 
        AVG(CAST(mr.rating AS DECIMAL(10, 2))) AS average_rating
    FROM 
        MovieRating mr 
    INNER JOIN 
        movies m ON mr.movie_id = m.movie_id
    WHERE 
        mr.created_at >= '2020-02-01' AND mr.created_at <= '2020-02-29'
    GROUP BY 
        m.title
    ORDER BY 
        average_rating DESC, 
        m.title ASC
)

SELECT name1 AS results
FROM TopUser

UNION ALL

SELECT title AS results
FROM MovieRatings;