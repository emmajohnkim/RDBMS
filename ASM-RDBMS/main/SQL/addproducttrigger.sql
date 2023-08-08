delimiter //
create trigger add_product before insert
on product
for each row begin
	if new.price < 0 then 
		set new.price = 0;
	end if;
    
    set new.name = CONCAT(UPPER(SUBSTRING(new.name,1,1)),LOWER(SUBSTRING(new.name,2)));
end // 





