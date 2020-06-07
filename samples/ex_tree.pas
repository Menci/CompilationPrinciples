program bit;
const a = 1; b = 2;
type aaa = integer; bbb = string;
var
    a: array[1..100000] of integer;
    n: integer;

function lowbit(x: integer): integer;
begin
    lowbit := x and -x;
end;

procedure update(pos, x: integer);
begin
    while pos <= n do
    begin
        a[pos] := a[pos] + x;
        pos := pos + lowbit(pos);
    end;
end;

function queryprefix(pos: integer): integer;
var
    ans: integer;

begin
    ans := 0;
    while pos > 0 do
    begin
        ans := ans + a[pos];
        pos := pos - lowbit(pos);
    end;
    queryprefix := ans;
end;

function query(l, r: integer): integer;
begin
    query := queryprefix(r) - queryprefix(l - 1);
end;

procedure main;
var
    m, i, x, t, a, b: integer;

begin
    read(n);
    for i := 1 to n do
    begin
        read(x);
        update(i, x);
    end;

    read(m);
    for i := 1 to m do
    begin
        read(t);
        read(a);
        read(b);
        if t = 1 then
        begin
            update(a, b);
        end
        else
        begin
            writeln(query(a, b));
        end;
    end;
end;

begin
    main;
end.
