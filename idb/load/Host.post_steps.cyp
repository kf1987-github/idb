//
// any cypher queries for modifying data after the loading process can be added here
//

// for example: add a new default field

match (n:Host)
where not n.host_name starts with 'node'
set n.legacy = 'yes'
return n.host_name;

