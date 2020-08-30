program onceList;

type
    itemptr = ^item;
	item = record
		data: integer;
		next: itemptr;
	end;

var
    c, first: itemptr;

begin
    new(first);
    first^.data := 25;
    new(first^.next);
    first^.next^.data := 36;
    new(first^.next^.next);
    first^.next^.next^.data := 49;
    first^.next^.next^.next := nil;

    c := first;
    while c <> nil do
	    begin
            writeln(c^.data);
		    c := c^.next;
	    end;
end.
