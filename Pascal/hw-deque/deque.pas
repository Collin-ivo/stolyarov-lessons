program deque;

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

procedure LongDequePushFront(var deque: LongDeque, n: longint);
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

procedure LongDequePushBack(var deque: LongDeque, n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.data := n;

    if deque.first <> nil then
    begin
        deque.first^.prev := tmp;
        tmp^.next := deque.first;
        tmp^.prev := nil;
    end
    else
    begin
        tmp^.prev := nil;
        tmp^.next := nil;
        deque.last := tmp;
    end;

    deque.first := tmp;
end;

function LongDequePopFront(var deque: LongDeque, var n: longint): boolean;
begin
end;

function LongDequePopBack(var deque: LongDeque, var n: longint): boolean;
begin
end;

function LongDequeIsEmpty(var deque: LongDeque): boolean;
begin
end;

