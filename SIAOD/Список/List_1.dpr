program List_1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Const
  mass:array[1..2,1..5] of integer =((1,2,3,4,5),(3,2,2,5,3));

Type
  queue= ^qu;
  qu= record
    next:queue;             {Cледуюший элемент}
    head:queue;            {Голова очереди}
    tail:queue;            {Конец очереди}
    priority:integer;     {Две очериди - два приоритета}
    task:integer;         {Число действий }
    waitt:boolean;        {Если не зватило тактов то оставляем в ожидании}
    enter:integer;        {сколько тактов ввода нам надо}
      end;
Var
  first,list,nextPri:queue;
  enterNum,i,takttime:integer;

procedure add(var first:queue;var list:queue;enterNum,j,i,prior:integer);

begin
  if first^.next=nil then
  begin
    new(first^.next);
    list:=first^.next;
    list^.next:=nil;
    list^.priority:=prior;
    new(first^.head);
    new(first^.tail);
    first^.head:=list;
    first^.tail:=list;

  end
  else
  begin
    if list^.next=nil then
    begin
      new(list^.next);
      list:=list^.next;
      list^.priority:=prior;
      list^.next:=nil;
    end
    else
      writeln('Исправляй блять!');
  end;
  first^.tail:=list;
  list^.enter:=enterNum;
  list^.task:=mass[j,i];
end;

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

procedure printList(first:queue);     {на вход пустой указатель}
begin
  first:=first^.next;
  while first<>nil do
  begin
    write(first^.task,' ');
    first:=first^.next;
  end;
end;

procedure proccese(var first:queue;var list:queue;takttime:integer;enterNum:integer;newPri:queue);


begin
  list:=first^.next;
  if list^.enter<>0 then
  begin
    if list^.enter<takttime then
      list^.enter:=0
    else
      list^.enter:= list^.enter-takttime;
  end;
                      {Останавился на вводе иноврмации с каждого элемента}
end;

begin
  enterNum:=1;
  takttime:=1;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(first);
  first^.next:=nil;
  new(list);
  new(nextPri);
  for i:=1 to 3 do
  begin
    add(first,list,enterNum,1,i,2);
  end;
  nextPri:=list;
  for i:=4 to 5 do
  begin
    add(first,list,enterNum,1,i,1);
  end;
  proccese(first,list,takttime,enterNum);
  printList(first);
  readln;
end.
