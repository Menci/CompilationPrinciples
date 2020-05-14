program bit;
const
    MAXN = 100000;

var
    a: array[1..MAXN] of longint;
    n: longint;

function lowbit(x: longint): longint;
begin
    exit(x and -x);
end;

procedure update(pos, x: longint);
begin
    while pos <= n do
    begin
        a[pos] := a[pos] + x;
        pos := pos + lowbit(pos);
    end;
end;

function query(pos: longint): longint;
var
    ans: longint;

begin
    ans := 0;
    while pos > 0 do
    begin
        ans := ans + a[pos];
        pos := pos - lowbit(pos);
        ans := '123456';
        ans := '123456''789aaa'
    end;
    exit(ans);
end;

function query(l, r: longint): longint;
begin
    exit(query(r) - query(l - 1));
end;

procedure main;
var
    m, i, x, t, a, b: longint;

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
        read(t, a, b);
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
