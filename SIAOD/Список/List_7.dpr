program List_7;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,math;

Const
  max:integer=2;

Type
  Tarray=array[1..5,1..11] of integer;
  TArrayField = array[1..5] of integer;
Const

  mass:Tarray =((5,3,2,1,5,2,3,2,1,6,0),
                (6,8,3,7,9,3,3,9,8,7,0),
                (7,6,3,2,5,3,6,8,1,3,4),
                (4,3,4,2,1,1,2,2,3,4,6),
                (6,8,7,3,2,1,6,3,2,1,6));

  CmassField:TArrayField = (1,1,1,1,1);


var
  massField:TArrayField;

Type
  queue= ^qu;
  qu= record
    next:queue;           {Cледуюший элемент}
    head:queue;           {Голова очереди}
    tail:queue;           {Конец очереди}
    priority:integer;     {приоритет элемента}
    task:integer;         {Число времени затраченного на обработку }
    waitt:boolean;        {Флаг на ожидание обработки}
    enterFlac:boolean;    {Флаг утверждающий,что ввод информации закончен} {true когда закончен}
    enterTakt:integer;        {Значение такта ввода информации}

    nomerSTR:integer;        {Положение в массиве}
    nomerFIELD:integer;
      end;
Var
  first,firstlist,nextPri:queue;
  //временное
    delell:queue;
  //
  second,secondlist:queue;
  enterNum,i,takttime,worktime,inaction:integer;
  {first and second указатели на очереди 1 и 2}
  {enterNum тактов ввода для ввода инфы}
  {takttime Время такта процессора}
  {worktime это значение ищеем
  это общее время работы программы}
  {inaction  это ищем
  время бездействия}

            {Передаем начало списка, элемент списка, количество тактов ввода,
            nomerSTR,nomerFIELD положение в массиве,  и приоритет,+установка ввода информации}
{Проходим до конца списка получаем элемент, у которого нет следующего}
procedure goend(Title:queue; var list:queue);
begin
  list:=title^.next;
  while list^.next<>nil do
  begin
    list:=list^.next;
  end;
end;

procedure printList(title:queue);     {на вход пустой указатель}
begin
  title:=title^.next;
  while title<>nil do
  begin
    write(title^.nomerSTR ,' ');
    title:=title^.next;
  end;
  writeln;
end;
                   {2 or 3}
function spotSTR(maxNUM:integer;title:queue):integer;
var
  str:string;
  list:queue;
  endtest:boolean;
  i:integer;
begin
  if MaxNum=3 then
  begin
    if title^.next=nil then
    begin
      result:=1;
      exit;
    end;
    list:=title;
    str:='123';
    repeat
      list:=list^.next;
      for i:=1 to MaxNum do
      begin
        if list^.nomerSTR=strtoint(str[i]) then
          str[i]:=chr(48);
      end;
    until list^.next=nil

  end
  else
  // если 2
  begin
    if title^.next=nil then
    begin
      result:=4;
      exit;
    end;
    list:=title;
    str:='45';
    repeat
      list:=list^.next;
      for i:=1 to MaxNum do
      begin
        if list^.nomerSTR=strtoint(str[i]) then
          str[i]:=chr(48);
      end;
    until list^.next=nil

  end;
  endtest:=false;
  i:=1;
  while endtest=false do
  begin
    if str[i]<>'0' then
    begin
      result:=strtoint(str[i]);
      endtest:=true;
    end;
    inc(i);
  end;
end;
procedure copylist(var dest:queue;src:queue);
begin
  dest^.next:=nil;
  dest^.priority:=src^.priority;
  dest^.task:=src^.task;
  dest^.waitt:=src^.waitt;
  dest^.enterFlac:=src^.enterFlac;
  dest^.enterTakt:=src^.enterTakt;
  dest^.nomerSTR:=src^.nomerSTR;
  dest^.nomerFIELD:=src^.nomerFIELD;
end;
procedure add(var title:queue;var list:queue;enterNum,prior:integer;enterFlac:boolean;MaxNum:integer;massfield:Tarrayfield);
var
  CountSpotSTR:integer;
begin
  if title^.head=nil then
  begin
    CountSpotSTR:=spotSTR(maxnum,title);
    new(title^.next);
    list:=title^.next;
    list^.next:=nil;
    list^.priority:=prior;
    list^.nomerSTR:=countSpotSTR;
    list^.nomerFIELD:=massfield[list^.nomerSTR];
    list^.task:=mass[list^.nomerSTR,list^.nomerFIELD];
    list^.enterFlac:=enterFlac;
    list^.waitt:=false;
    list^.enterTakt:=enterNum;
    {Создание головного и хвостового элемен}
    title^.head:=list;
    title^.tail:=list;

  end
  else
  begin
    CountSpotSTR:=spotSTR(maxnum,title);
    goend(title,list);
    new(list^.next);
    list:=list^.next;
    list^.next:=nil;
    list^.priority:=prior;
    list^.nomerSTR:=countSpotSTR;
    list^.nomerFIELD:=massfield[list^.nomerSTR];
    list^.task:=mass[list^.nomerSTR,list^.nomerFIELD];
    list^.enterFlac:=enterFlac;
    list^.enterTakt:=enterNum;
    list^.waitt:=false;
    title^.tail:=list;
  end;
  {Можно уменьшить количество строк, но лень}

end;
{начальная инициализация}
Procedure ini;
begin
  {Действия со списками }
  new(first);
  new(second);
  new(first^.head);
  new(first^.tail);
  new(second^.head);
  new(second^.tail);
  first^.head:=nil;
  first^.tail:=nil;
  second^.head:=nil;
  second^.tail:=nil;
  first^.next:=nil;
  second^.next:=nil;
  new(firstlist);
  new(secondlist);
  {Действия с массивом}
  massField:=CmassField;
end;

{Процедура удаляет элемент из учереди}
procedure del(var title:queue;var massfield:Tarrayfield);
begin
  if title^.next.waitt=false then
  begin
    inc(massField[title^.next.nomerSTR])
  end;
  if (title^.next<>nil) and(title^.next.next<>nil) then
  begin
    title^.head:=title^.next.next;
    title^.next:=title^.next.next;

  end
  else
  begin
    title^.head:=nil;
    title^.tail:=nil;
    title^.next:=nil;
  end;
  printList(title); 
end;

{Вроде не нужна}
procedure delel(var title:queue;delELL:queue);
var
  nopeEl:integer;
  primaretitle,pred,nextEl:queue;
begin
  new(primaretitle);
  primaretitle:=title;

  while (title<>delELL) or (title=nil) do
  begin
    pred:=title;
    title:=title^.next;
  end;
  if title=delELL then
  begin
    title:=pred;
    if title^.next.next<>nil then
      title^.next:=title^.next.next
    else
    begin
      title^.next:=nil;
      title^.head:=nil;
      title^.tail:=nil;
    end;
  end;
  title:=primaretitle;
end;



{Ввод информации}
procedure InfoInput(var title:queue;list:queue;takttime:integer);

begin
  list:=title^.next;
  while list<>nil do
  begin
    if list^.enterTakt > 0 then
    begin
      list^.enterTakt:=list^.enterTakt-takttime;
      if list^.enterTakt <=0 then
      begin
        list^.enterTakt:=0;
        list^.enterFlac:=true;
      end;
    end;
    list:=list^.next;
  end;
end;

procedure work (var list:queue;takttime:integer;var inaction:integer);
begin
  if takttime>list^.task then
    inaction:=inaction+takttime-list^.task ;
  list^.task:=list^.task-takttime;
  list^.waitt:=true;
  if list^.task<=0 then
  begin
    list^.task:=0;
    list^.waitt:=false;

  end;
end;

function nextqueue(title:queue):boolean;
begin
  if title^.head=nil then
    result:=true
  else
    result:=false;
end;
function endprocces(massField:TArrayField):boolean;
var
  i:integer;
begin
  result:=true;
  for i:=1 to 5 do
  begin
    if massField[i]<2 then       {2 это количество элементов в строке}
      result:=false;
  end;
end;

procedure sendToEnd(var title:queue;var list:queue);
var

  temp,start:queue;
begin
  {new(start);
  start:=title;}
  new(temp);
  temp:=title^.next;
  del(title,massfield);
  while list^.next<>nil do
  begin
    list:=list^.next;
  end;
  new(list^.next);
  list:=list^.next;
  copylist(list,temp);

  title^.tail:=list;
  {test}
   printList(title);
  //dispose(temp);

end;

function testOfadd (title,list:queue;countEl:integer):integer;
var
  CountHave:integer;
begin
  counthave:=0;
  list:=title^.next;
  while list<>nil do
  begin
    inc(counthave);
    list:=list^.next;
  end;
  result:=countEL-counthave;
end;

procedure proccese(first,second,firstlist,secondlist:queue;massField:TArrayField;
                    enterNum,takttime:integer; var worktime:integer;var inaction:integer);
var
  i:integer;
  NeedaddEl:boolean;
  Circle_passed:integer;
  tempvalue:queue;
begin
  new(tempvalue);
  firstlist:=first^.next;
  secondlist:=second^.next;
  worktime:=ceil(enterNum/takttime);
  inaction:= (enterNum mod takttime);
  for i:=1 to 3 do
    add(first,firstlist,enterNum,2,true,3,massfield);
  for i:=1 to 2 do
    add(second,secondlist,enterNum,1,true,2,massfield);
  repeat
    firstlist:=first^.next;
    Circle_passed:=0;
    NeedaddEl:=true;
    firstlist:=first^.next;
    repeat {Круг с большим приоритетом}

    if NeedaddEl then
      for i:=1 to testofadd(first,firstlist,3) do
      begin
        add(first,firstlist,enterNum,2,false,3,massfield);
        NeedaddEl:=false;
        firstlist:=first^.next;
      end;
      {Можем не выполнить цикл, а это надо}
      if Circle_passed=0 then
        NeedaddEl:=false;
      {Если информация введина, то можно обрабатывать}
      if firstlist^.enterFlac then
        work(firstlist,takttime,inaction)
      else
        inaction:=inaction+takttime;
      {Обрабатываем результаты обработки}
      if (firstlist^.waitt=false) and (firstlist^.enterFlac) then
      begin
        tempvalue:=first^.next.next;
        del(first,massfield);
        firstlist:=tempvalue;
      end
      else
      begin
        tempvalue:=first^.next.next;
        sendtoend(first,firstlist);
        firstlist:=tempvalue;
      end;
      {Переход к следующему или к первому элементу}
      if firstlist=nil then
        firstlist:=first^.next;
      {Проверка на пройденный круг, если прошли то снова можно загружать элементы}
      inc(Circle_passed);
      if Circle_passed>3 then
      begin
        Circle_passed:=0;
        needaddel:=true;
      end;

      infoinput(first,firstlist,takttime);
      infoinput(second,secondlist,takttime);

      inc(worktime);
    until nextqueue(first);
  until endprocces(massField);

end;

begin
  ini;
  worktime:=0;
  enterNum:=3;
  takttime:=4;
  inaction:=0;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  proccese(first,second,firstlist,secondlist,massField,1,1,worktime,inaction);
  //printList(first);
  readln;
end.
