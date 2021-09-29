/*
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

*/

select n, (case when lvl=1 then 'Root' 
                       when leaf=1 then 'Leaf'
                       when leaf=0 then 'Inner' end) leaf 
from         
(select n, p, level lvl, CONNECT_BY_ISLEAF AS leaf
from   BST 
start with p is null
connect by p = prior n order by n);
