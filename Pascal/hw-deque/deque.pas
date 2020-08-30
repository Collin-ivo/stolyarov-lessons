program dequeList;

type
    LongItem2Ptr = ^LongItem2;
    LongItem2 = record
        data: longint;
        prev, next: LongItem2Ptr;
    end;

    LongDeque = record
        first, last: LongItem2Ptr;
    end;

procedure LongDequeInit(var deque: LongDeque);
begin
    deque.first := nil;
    deque.last := nil;
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.data := n;

    if deque.last <> nil then
    begin
        deque.last^.next := tmp;
        tmp^.prev := deque.last;
        tmp^.next := nil;
    end
    else
    begin
        tmp^.prev := nil;
        tmp^.next := nil;
        deque.first := tmp;
    end;

    deque.last := tmp;
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
begin
    if deque.first <> nil then
    begin
        new(deque.first^.prev);
        deque.first^.prev^.next := deque.first;
        deque.first := deque.first^.prev;
    end
    else
    begin
        new(deque.first);
        deque.last := deque.first;
        deque.first^.prev := nil;
        deque.first^.next := nil;
    end;

    deque.first^.data := n;
end;

function LongDequePopFront(var deque: LongDeque; var n: longint): boolean;
var
    tmp: LongItem2Ptr;
begin
    if (deque.first = nil) then
    begin
        LongDequePopFront := false;
        exit
    end;
    
    tmp := deque.first;
    n := tmp^.data;
    if tmp^.next <> nil then
        tmp^.next^.prev := nil;
    deque.first := tmp^.next;
    dispose(tmp);
    LongDequePopFront := true;
end;

function LongDequePopBack(var deque: LongDeque; var n: longint): boolean;
var
    tmp: LongItem2Ptr;
begin
    if deque.last = nil then
    begin
        LongDequePopBack := false;
        exit
    end;

    tmp := deque.last;
    n := tmp^.data;
    if tmp^.prev <> nil then
        tmp^.prev^.next := nil;
    deque.last := tmp^.prev;
    dispose(tmp);
    LongDequePopBack := true;
end;

function LongDequeIsEmpty(var deque: LongDeque): boolean;
begin
    LongDequeIsEmpty := deque.first = nil;
end;

var
    deque: LongDeque;
    tmp: LongItem2Ptr;
    num: longint;
begin
    LongDequeInit(deque);

    while not SeekEof do
    begin
        readln(num);
        LongDequePushBack(deque, num);
    end;

    writeln('POP: BEGIN');
    while LongDequePopFront(deque, num) do
    begin
        writeln(num);
    end;
    writeln('POP: END;');
end.
