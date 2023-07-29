
MATCH (n)
RETURN labels(n), keys(n), size(keys(n)), count(*)
ORDER BY size(keys(n)) DESC

