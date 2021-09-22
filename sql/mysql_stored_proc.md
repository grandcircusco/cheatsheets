To create a stored procedure from within MySQL Workbench:

```
DELIMITER //

create procedure GetProdsInCat(in catid varchar(4))
begin
	select * from product where categoryId = catid;
end //

DELIMITER ;
```
