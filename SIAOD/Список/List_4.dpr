program List_4;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,math;

Const
  max:integer=2;

Type
  Tarray=array[1..5,1..2] of integer;
  TArrayField = array[1..5] of integer;
Const

  mass:Tarray =((1,2),
                (3,2),
                (4,2),
                (2,2),
                (5,2));

  CmassField:TArrayField = (1,1,1,1,1);


var
  massField:TArrayField;

Type
  queue= ^qu;
  qu= record
    next:queue;           {C�������� �������}
    head:queue;           {������ �������}
    tail:queue;           {����� �������}
    priority:integer;     {��������� ��������}
    task:integer;         {����� ������� ������������ �� ��������� }
    waitt:boolean;        {���� �� �������� ���������}
    enterFlac:boolean;    {���� ������������,��� ���� ���������� ��������}
    enterTakt:integer;        {�������� ����� ����� ����������}

    nomerSTR:integer;        {��������� � �������}
    nomerFIELD:integer;
      end;
Var
  first,firstlist,nextPri:queue;
  //���������
    delell:queue;
  //
  second,secondlist:queue;
  enterNum,i,takttime,worktime,inaction:integer;
  {first and second ��������� �� ������� 1 � 2}
  {enterNum ������ ����� ��� ����� ����}
  {takttime ����� ����� ����������}
  {worktime ��� �������� �����
  ��� ����� ����� ������ ���������}
  {inaction  ��� ����
  ����� �����������}

            {�������� ������ ������, ������� ������, ���������� ������ �����,
            nomerSTR,nomerFIELD ��������� � �������,  � ���������,+��������� ����� ����������}
{�������� �� ����� ������ �������� �������, � �������� ��� ����������}
procedure goend(Title:queue; var list:queue);
begin
  list:=title^.next;
  while list^.next<>nil do
  begin
    list:=list^.next;
  end;
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
  // ���� 2
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

procedure add(var title:queue;var list:queue;enterNum,prior:integer;enterFlac:boolean;MaxNum:integer);
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

    {�������� ��������� � ���������� ������}
    title^.head:=firstlist;
    title^.tail:=firstlist;

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
    list^.waitt:=false;
    title^.tail:=list;
  end;
  {����� ��������� ���������� �����, �� ����}

end;
{��������� �������������}
Procedure ini;
begin
  {�������� �� �������� }
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
  {�������� � ��������}
  massField:=CmassField;
end;

{��������� ������� ������� �� �������}
procedure del(var title:queue);
begin
  if title^.next.waitt=false then
  begin
    inc(massField[title^.next.nomerSTR])
  end;
  if (title^.next<>nil) and(title^.next.next<>nil) then
  begin
    title^.next:=title^.next.next;
    title^.head:=title^.next.next;
  end
  else
  begin
    title^.head:=nil;
    title^.tail:=nil;
    title^.next:=nil;
  end;
end;

{����� �� �����}
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

procedure printList(title:queue);     {�� ���� ������ ���������}
begin
  title:=title^.next;
  while title<>nil do
  begin
    write(title^.nomerSTR ,' ');
    title:=title^.next;
  end;
end;

procedure proccese(first,second,firstlist,secondlist:queue;massField:TArrayField;
                    enterNum,takttime:integer; var worktime:integer;var inaction:integer);
var
  i:integer;
begin
  worktime:=ceil(enterNum/takttime);
  inaction:= takttime-(enterNum mod takttime);
  for i:=1 to 3 do
    add(first,firstlist,enterNum,2,false,3);
  for i:=1 to 2 do
    add(second,secondlist,enterNum,1,false,3);
  {����� 2 ������� � �� ��������}
  {�������� ����������(�������� �����) � �������� ����� ������� ��������� ������� � ��������� �������
  + ����� �����}
end;

begin
  ini;
  worktime:=0;
  enterNum:=3;
  takttime:=4;
  inaction:=0;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  //printList(first);
  readln;
end.
