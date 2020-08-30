program queue;

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
    number, i: integer;

procedure add(var list: linkedList; var item: itemptr);
    begin
        item^.next := nil;

        if list.first = nil then
            list.first := item;

        if list.last = nil then
            list.last := item
        else
            begin
                list.last^.next := item;
                list.last := item;
            end;
        
        list.itemsTotal := list.itemsTotal + 1;
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

    for i := 1 to 2 do
        begin
            temp := list.first;
            while temp <> nil do
	            begin
                    writeln(temp^.data);
		            temp := temp^.next;
	            end;
        end;
end.
