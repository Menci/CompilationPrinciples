type
	student = record
		name: string;
		id: integer;
	end;
	class = record
		name: string;
		students: array [1..10] of student;
	end;
var
	c: class;
begin
	reads(c.name);
	reads(c.students[1].name);
	read(c.students[3].id);
	reads(c.students[3].name);
	writesln(c.students[3].name);
	writeln(c.students[3].id);
	writesln(c.students[1].name);
	writesln(c.name);
end.
