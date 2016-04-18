program List_3;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,math;

Const
  max:integer=2;
  mass:array[1..5,1..max] of integer =((1,2),(3,2),(4,2),(2,2),(5,2));

Type
  queue= ^qu;
  qu= record
    next:queue;           {Cледуюший элемент}
    head:queue;           {Голова очереди}
    tail:queue;           {Конец очереди}
    priority:integer;     {Две очериди - два приоритета}
    task:integer;         {Число действий }
    waitt:boolean;        {Если не зватило тактов то оставляем в ожидании}
    enter:integer;        {сколько тактов ввода нам надо}
    nomer:integer;        {задействованное задание}
    nomerMas:integer;
      end;
Var
  first,firstlist,nextPri:queue;
  second,secondlist:queue;
  enterNum,i,takttime,worktime:integer;

procedure add(var first:queue;var firstlist:queue;enterNum,j,i,prior:integer);

begin
  if first^.next=nil then
  begin
    new(first^.next);
    firstlist:=first^.next;
    firstlist^.next:=nil;
    firstlist^.priority:=prior;
    firstlist^.nomer:=1;
    firstlist^.nomerMas:=i;
    firstlist^.waitt:=false;
    new(first^.head);
    new(first^.tail);
    first^.head:=firstlist;
    first^.tail:=firstlist;

  end
  else
  begin
    if firstlist^.next=nil then
    begin
      new(firstlist^.next);
      firstlist:=firstlist^.next;
      firstlist^.nomer:=1;
       firstlist^.nomerMas:=i;
      firstlist^.priority:=prior;
      firstlist^.waitt:=false;
      firstlist^.next:=nil;
    end
    else
      writeln('Исправляй блять!');
  end;
  first^.tail:=firstlist;
  firstlist^.enter:=enterNum;
  firstlist^.task:=mass[j,i];
end;

{Процедура удаляет элемент из учереди}
procedure del(var first:queue);


begin
  if (first^.next<>nil) and(first^.next.next<>nil) then
  begin
    first^.next:=first^.next.next;
    first^.head:=first^.next.next;
  end
  else
  begin
    first^.next:=nil;
  end;
end;
{Вроде не нужна}
{procedure delel(var first:queue;delELL:queue);
var
  nopeEl:integer;
  firstlist,pred,nextEl:queue;
begin
  firstlist:=first;

  while (first<>delELL) or (first=nil) do
  begin
    pred:=first;
    first:=first^.next;
  end;
  if first=delELL then
  begin
    first:=pred;
    if first^.next.next<>nil then
      first^.next:=first^.next.next
    else
      first^.next:=nil;
  end;
  first:=firstlist;
end;  }

procedure printList(first:queue);     {на вход пустой указатель}
begin
  first:=first^.next;
  while first<>nil do
  begin
    write(first^.task,' ');
    first:=first^.next;
  end;
end;

procedure proccese(var first:queue;var firstlist:queue;takttime:integer;enterNum:integer;newPri:queue;var worktime:integer);
Var
  nextEl:queue;
  testWait:boolean;

begin

end;

begin
  worktime:=0;
  enterNum:=1;
  takttime:=1;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(first);
  first^.next:=nil;
  new(firstlist);
  new(nextPri);
  for i:=1 to 3 do
  begin
    add(first,firstlist,enterNum,1,i,2);
  end;
  nextPri:=firstlist;
  for i:=4 to 5 do
  begin
    add(first,firstlist,enterNum,1,i,1);
  end;
  //proccese(first,firstlist,takttime,enterNum,worktime);
  firstlist:=first^.next.next.next;
  //delEl(first,firstlist);
  firstlist:=nil;
  firstlist:=first^.next.next.next;
  writeln(firstlist^.task);
  printList(first);
  readln;
end.
