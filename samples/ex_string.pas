var
	a, b: string;
	n, i: integer;
begin
	readsln(a);
	n := strlen(a);

	b := a;
	for i := 0 to n - 1 do
		setchr(b, i, getchr(a, n - i - 1));
	
	writesln(b);
end.
