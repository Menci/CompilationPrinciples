type
  mytype = record
    a: longint;
    b: integer;
    c: string;
  end;
function f1(x: longint): longint;
  var
    v1, v2, v3: longint;
    a1, a2, a3: array [0..100, -50..50] of longint;
  function f2(x: longint): longint;
    var
      v4, v5: longint;
    function f3(x: longint): longint;
      begin
        writeln('qwq!');
        f3 := 23333;
      end;
    begin
      f2 := f3(x);
    end;
  begin
    f1 := f2(x);
  end;
begin
  writeln(f1(123456));
end.
