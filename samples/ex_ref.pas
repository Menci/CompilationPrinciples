var
	a, b: integer;
procedure f(var a: integer; b: integer);
begin
	a := 123;
	b := 456;
end;
begin
	a := 1;
	b := 2;
	f(a, b);
	writeln(a);
	writeln(b);
end.
