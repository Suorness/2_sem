program List_2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,math;

Const
  mass:array[1..5,1..2] of integer =((1,2),(3,2),(4,2),(2,2),(5,2));

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
    nomer:integer;      {задействованное задание}
    nomerMas:integer;
      end;
Var
  first,list,nextPri:queue;
  enterNum,i,takttime,worktime:integer;

procedure add(var first:queue;var list:queue;enterNum,j,i,prior:integer);

begin
  if first^.next=nil then
  begin
    new(first^.next);
    list:=first^.next;
    list^.next:=nil;
    list^.priority:=prior;
    list^.nomer:=1;
    list^.nomerMas:=i;
    list^.waitt:=false;
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
      list^.nomer:=1;
       list^.nomerMas:=i;
      list^.priority:=prior;
      list^.waitt:=false;
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

procedure delel(var first:queue;delELL:queue);
var
  nopeEl:integer;
  list,pred,nextEl:queue;
begin
  list:=first;

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
  first:=list;
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

procedure proccese(var first:queue;var list:queue;takttime:integer;enterNum:integer;newPri:queue;var worktime:integer);
Var
  nextEl:queue;
  testWait:boolean;

begin
  list:=first^.next;
  testWait:=false;
  worktime:=worktime+ceil(EnterNum/takttime);
  while list<>nil do
  begin
    list^.enter:=0;
    list:=list^.next;
  end;
  list:=first^.next;
  repeat
    if list^.task>takttime then                  {отнимает такты в заданой задаче}
    begin
      list^.task:=list^.task-takttime;
      worktime:=worktime+takttime;
      testWait:=true;
      list^.waitt:=true;
    end
    else
    begin
      worktime:=worktime+takttime;
      list^.task:=0;                      {Если такты закончились}
      if list^.nomer<5 then               {Проверяем на наличие следующего задания в данном элементе}
      begin
        list^.task:=mass[list^.nomerMas,list^.nomer]; {забираем задачу из двумерного массива }
        list^.enter:=enterNum;            {Если есть увеличиваем номер и заганяем }
        list^.nomer:=list^.nomer+1
      end
      else
      begin
        nextEl:=list^.next;                                 {Иначе удаляем элемент}
        delEl(first,list);
        list:=nextEl;
      end;
    end;

  until (testWait=false);


 { if list^.enter<>0 then
  begin
    if list^.enter<takttime then
      list^.enter:=0
    else
      list^.enter:= list^.enter-takttime;

  end;}

                      {Останавился на вводе иноврмации с каждого элемента}
end;

begin
  worktime:=0;
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
  //proccese(first,list,takttime,enterNum,worktime);
  list:=first^.next.next.next;
  delEl(first,list);
  list:=nil;
  list:=first^.next.next.next;
  writeln(list^.task);
  printList(first);
  readln;
end.
