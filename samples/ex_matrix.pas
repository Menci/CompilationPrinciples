program ex_matrix;
type
	matrix = array [1..20, 1..20] of integer;
var
	a, b, res, tmp: matrix;
	n, p, m: integer;
	i, j, k: integer;
begin
	read(n);
	read(p);
	read(m);

	for i := 1 to n do
		for j := 1 to p do
			read(a[i, j]);

	for i := 1 to p do
		for j := 1 to m do
			read(b[i, j]);

	for i := 1 to n do
		for j := 1 to p do
			for k := 1 to m do
				tmp[i, k] := tmp[i, k] + a[i, j] * b[j, k];
	res := tmp;

	for i := 1 to n do
		for j := 1 to m do
			if j = m then
				writeln(res[i, j])
			else begin
				write(res[i, j]);
				writes(' ');
			end
end.
