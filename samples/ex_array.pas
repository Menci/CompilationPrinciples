type
	arr = array [1..3, 1..2] of integer;
var
	a: arr;
procedure work(var a: arr);
	var
		op, i, j: integer;
		p: ^integer;
	begin
		read(op);
		read(i);
		read(j);
		p := @a[i, j];
		if op = 0 then read(p^)
		else write(p^);
	end;
begin
	while 1 do work(a);
end.
