program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
type
  adlist = ^elemlist;
  elemlist = record
    number : integer;
    name : string;
    next : adlist;
  end;

var first, list, delEl : adlist;
    count,n,k,lastGuy : integer;
    printFlag : boolean;

procedure newList(n : integer);
var i : integer;
begin
  new(first);
  list := first;
  for i := 1 to n do
  begin
    new(list^.next);
    list := list^.next;
    list^.number := i;
    list^.name := 'rebenok';
    list^.next := nil;
  end;
  list^.next := first;
end;

procedure printList(list : adlist);
begin
  list := first^.next;
  while list <> first do
    begin
      if printflag = true
      then
        writeln(list^.name,' ',list^.number)
      else
        write(list^.number:2);
      list := list^.next;
    end;
end;

{procedure deleteList(list : adlist; k : integer);
var Flag : boolean;
    i : integer;
begin
  list := first;
  repeat
  i := 0;
  while i < k-1 do
  begin
    list := list^.next;
    inc(i);
    if list^.next = first
    then
      list := first;
  end;
  writeln('deleted' ,list^.next^.number);
  list^.next := list^.next^.next;
  until first^.next^.next = first;
end;  }

procedure deleteList(list : adlist; k : integer);
var i : integer;
begin
  list := first;
  if (k = 1) or (first^.next^.next = first)  then  {для k=1}
  repeat
    if printflag = true then
      write(list^.next^.number,' ');
    if first^.next^.next <> first then
      begin
        delEl := list^.next;
        list^.next := list^.next^.next;
        dispose(delEl);
      end;
  until first^.next^.next = first
  else           {для k>1}
  begin
  repeat
  i := 0;
  while i < k-1 do
  begin
    list := list^.next;
    inc(i);
    if list^.next = first
    then
      list := first;
    if (i >= k-1) then
    begin
      if printflag = true then
        write(list^.next^.number,' ');
      delEl := list^.next;
      list^.next := list^.next^.next;
      dispose(delEl);
      if list^.next = first then
        list := list^.next;
    end;
  end;
  until first^.next^.next = first;
  lastGuy := first^.next^.number;
  end;
end;

begin
printflag := true;
repeat
writeln('vvedite kol-vo detei');
readln(n);
if n < 1 then
  writeln('povtorite vvod!!!');
until n>=1;
repeat
writeln('vvedite do skolki s4itat');
readln(k);
if k < 1 then
  writeln('povtorite vvod!!!');
until k>=1;
newlist(n);
writeln('-----------------------------------');
writeln('Vashi deti: ');
printList(list);
writeln('-----------------------------------');
write('deleted: ');
deletelist(list,k);
writeln;
write('ostalsia: ');
printlist(list);
writeln('-----------------------------------');
printflag := false;
writeln('Table: ');
writeln('-----------------------------------');
writeln('        n.detei  | n.ost ');
k := 2;
for count := 1 to 64 do
begin
  newlist(count);
  deletelist(list,k);
  write('        ',count:2,'       | ');
  printlist(list);
  writeln;
end;
writeln('-----------------------------------');
readln;
end.
