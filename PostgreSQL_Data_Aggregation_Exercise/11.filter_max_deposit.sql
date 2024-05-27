SELECT 
	magic_wand_creator,
	max(deposit_amount) AS max_deposit_amount
FROM wizard_deposits
GROUP BY magic_wand_creator
HAVING  max(deposit_amount) > 40000 OR max(deposit_amount) < 20000
ORDER BY max_deposit_amount DESC
LIMIT 3
