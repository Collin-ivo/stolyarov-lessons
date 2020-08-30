program stack;

type
    itemptr = ^item;
	item = record
		data: integer;
		next: itemptr;
	end;
    linkedList = record
        first: itemptr;
        last: itemptr;
        itemsTotal: integer;
    end;

var
    element, temp: itemptr;
    list: linkedList;
    number: integer;

procedure add(var list: linkedList; var item: itemptr);
    begin
        if list.last = nil then
            list.last := item;
        item^.next := list.first;
        
        list.first := item;
        list.itemsTotal := list.itemsTotal + 1;
    end;

procedure pop(var list: linkedList);
    begin
        element := list.first;
        if list.first <> nil then
            list.first := list.first^.next;
        if list.first = nil then
            list.last := nil;
    end;

begin
    list.first := nil;
    list.last := nil;
    list.itemsTotal := 0;

    while not SeekEof do
        begin
            read(number);
            new(element);
            element^.data := number;
            add(list, element);
        end;


    temp := list.first;
    while temp <> nil do
	    begin
            writeln(temp^.data);
		    temp := temp^.next;
	    end;
end.
