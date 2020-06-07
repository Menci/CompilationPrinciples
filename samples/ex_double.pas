var
	n, i: integer;
	x: double;
begin
	read(n);
	for i := 1 to n do begin
		if i mod 2 = 1 then
			x := x + 1 / (2 * i - 1)
		else
			x := x - 1 / (2 * i - 1);
	end;
	writefln(x * 4);
end.
