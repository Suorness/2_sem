unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

Type
  Tarray=array[1..5,1..11] of integer;
  TArrayField = array[1..5] of integer;
  TArrayRES= array[1..10,1..10] of integer;

  queue= ^qu;
  qu= record
    next:queue;           {C�������� �������}
    head:queue;           {������ �������}
    tail:queue;           {����� �������}
    priority:integer;     {��������� ��������}
    task:integer;         {����� ������� ������������ �� ��������� }
    waitt:boolean;        {���� �� �������� ���������}
    enterFlac:boolean;    {���� ������������,��� ���� ���������� ��������} {true ����� ��������}
    enterTakt:integer;        {�������� ����� ����� ����������}

    nomerSTR:integer;        {��������� � �������}
    nomerFIELD:integer;
  end;

  TForm1 = class(TForm);

  Const

  mass:Tarray =((5,3,2,1,5,2,3,2,1,6,0),
                (6,8,3,7,9,3,3,9,8,7,0),
                (7,6,3,2,5,3,6,8,1,3,4),
                (4,3,4,2,1,1,2,2,3,4,6),
                (6,8,7,3,2,1,6,3,2,1,6));
{218}

  CmassField:TArrayField = (1,1,1,1,1);

  //private
    { Private declarations }
  //public
    //AWorktime:TarrayRES;
    //Ainaction:TarrayRES;
  //end;

var
  Form1: TForm1;
  massField:TArrayField;
  first,firstlist,nextPri:queue;
  AWorktime:TarrayRES;
  Ainaction:TarrayRES;
  second,secondlist:queue;
  enterNum,i,j,takttime,worktime,inaction:integer;

implementation

{$R *.dfm}
procedure goend(Title:queue; var list:queue);
begin
  list:=title^.next;
  while list^.next<>nil do
  begin
    list:=list^.next;
  end;
end;

procedure printList(title:queue);     {�� ���� ������ ���������}
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
function spotSTR(maxNUM:integer;title:queue;massfield:TArrayfield):integer;
var
  str:string;
  list:queue;
  endtest:boolean;
  i:integer;
begin
  result:=0;
  if MaxNum=3 then
  begin
    list:=title;
    str:='123';
    if title^.next=nil then
    begin
      i:=1;
      while i<=length(str) do
      begin
        if massfield[i]<12 then
        begin
          result:=i;
          i:=length(str)+1;
        end
        else
          inc(i);
      end;

        exit;
    end;

    repeat
      list:=list^.next;
      for i:=1 to MaxNum do
      begin
        if list^.nomerSTR=strtoint(str[i]) then
        begin
          str[i]:=chr(48);
          if massfield[strtoint(str[i])]>12 then
            str[i]:=chr(48);
        end;
      end;
    until list^.next=nil

  end
  else
  // ���� 2
  begin
    list:=title;
    str:='45';
    if title^.next=nil then
    begin
      i:=1;
      while i<=length(str) do
      begin
        if massfield[i+3]<12 then
        begin
          result:=i+3;
          i:=length(str)+1;
        end
        else
          inc(i);
      end;

        exit;
    end;


    repeat
      list:=list^.next;
      for i:=1 to MaxNum do
      begin
        if list^.nomerSTR=strtoint(str[i]) then
          str[i]:=chr(48);
        if massfield[strtoint(str[i])]>12 then
          str[i]:=chr(48);
      end;
    until list^.next=nil;

  end;
  endtest:=false;
  i:=1;
  while endtest=false do
  begin
    if str[i]<>'0' then
    begin
      if massfield[strtoint(str[i])]<12 then
      begin
        result:=strtoint(str[i]);
        endtest:=true;
      end;
    end;
    inc(i);
    if (i>length(str)) and (endtest=false) then
    begin
      result:=0;
      endtest:=true;
    end;
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
    CountSpotSTR:=spotSTR(maxnum,title,massfield);
    if CountSpotSTR=0 then
      exit;
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
    {�������� ��������� � ���������� ������}
    title^.head:=list;
    title^.tail:=list;

  end
  else
  begin
    CountSpotSTR:=spotSTR(maxnum,title,massfield);
    if CountSpotSTR=0 then
      exit;
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



{���� ����������}
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
  begin                 {<11}
    if massField[i]<12 then       {11 ��� ���������� ��������� � ������}
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
// true - ����� �������� � ������� ����� �����������
function testEndBigCircle(massfield:TarrayField):boolean;
var
  i:integer;
begin
  result:=true;
  for i:=1 to 3 do
    if massfield[i]<=11 then
      result:=false;
end;

function howMachEndEl(title,list:queue;massfield:tarrayfield;numEl:integer):integer;
var
  i:integer;
begin
  result:=0;
  if numEl=3 then
  begin
    for i:=1 to 3 do
    begin
      if massfield[i]>=12 then
        inc(result)
    end;
  end
  else
  begin
    for i:=4 to 5 do
    begin
      if massfield[i]>12 then
        inc(result)
    end;
  end;
end;

function HowMachElinListNow(title,list:queue):integer;
begin
  result:=0;
  list:=title^.next;
  while list<>nil do
  begin
    inc(result);
    list:=list^.next;
  end;
end;
//true ���� ��� ������
function litlcircle(second,secondlist:queue;var smallcircle:integer;massfield:Tarrayfield):boolean;
var
  i:integer;
begin
  inc(smallcircle);
  result:=false;
  if smallcircle>1 then
  begin
    result:=true;
     smallcircle:=0;
  end;
  if (massfield[4]>11) and (massfield[5]>11) then
    result:=true;
end;

procedure proccese(first,second,firstlist,secondlist:queue;massField:TArrayField;
                    enterNum,takttime:integer; var worktime:integer;var inaction:integer);
var
  i:integer;
  NeedaddEl:boolean;
  Circle_passed,testadd:integer;
  tempvalue:queue;
  smallcircle:integer;
begin
  smallcircle:=0;
  new(tempvalue);
  firstlist:=first^.next;
  secondlist:=second^.next;
  worktime:= enterNum div takttime;
  if enterNum mod takttime <>0 then
    inc(worktime);
  inaction:=worktime*takttime;

  for i:=1 to 3 do
    add(first,firstlist,enterNum,2,true,3,massfield);
  for i:=1 to 2 do
    add(second,secondlist,enterNum,1,true,2,massfield);
  Circle_passed:=0;
  repeat
    firstlist:=first^.next;

    NeedaddEl:=true;
    firstlist:=first^.next;
    if testEndBigCircle(Massfield)=false then
    repeat {���� � ������� �����������}
    if (HowMachElInListNow(first,firstlist)=1) and (HowMachEndEL(first,firstlist,massfield,3)= 2)  then
      needaddel:=false;
    if NeedaddEl then
    begin
    //��� ������)
      testadd:=testofadd(first,firstlist,3)- howMachEndEl(first,firstlist,massfield,3);
      for i:=1 to testadd do
      begin
        add(first,firstlist,enterNum,2,false,3,massfield);
        NeedaddEl:=false;
        firstlist:=first^.next;
      end;
    end;
      {����� �� ��������� ����, � ��� ����}
      if Circle_passed=0 then
        NeedaddEl:=false;
      {���� ���������� �������, �� ����� ������������}
      if firstlist^.enterFlac then
        work(firstlist,takttime,inaction)
      else
        inaction:=inaction+takttime;
      {������������ ���������� ���������}
      if (firstlist^.waitt=false) and (firstlist^.enterFlac) then
      begin
        tempvalue:=first^.next.next;
        del(first,massfield);
        firstlist:=tempvalue;
      end
      else
      begin
        if (HowMachElInListNow(first,firstlist)<>1) and (HowMachEndEL(first,firstlist,massfield,3)<> 2) then
        begin
          tempvalue:=first^.next.next;
          sendtoend(first,firstlist);
          firstlist:=tempvalue;
        end;
      end;
      {������� � ���������� ��� � ������� ��������}
      if firstlist=nil then
        firstlist:=first^.next;
      {�������� �� ���������� ����, ���� ������ �� ����� ����� ��������� ��������}
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

  //����� ���� �����
    //�������� ���������� ���������
    repeat
      for i:=1 to testofadd(second,secondlist,2) do
      begin
        add(second,secondlist,enterNum,1,false,2,massfield);
        secondlist:=second^.next;
      end;
      //���������
      if secondlist^.enterFlac then
        work(secondlist,takttime,inaction)
      else
        inaction:=inaction+takttime;

//������������ ���������� ���������
        if (secondlist^.waitt=false) and (secondlist^.enterFlac) then
        begin
          tempvalue:=second^.next.next;
          del(second,massfield);
          secondlist:=tempvalue;
        end
        else
        begin
          if (HowMachElInListNow(second,secondlist)<>1) and (HowMachEndEL(second,secondlist,massfield,2)<> 1) then
          begin
            tempvalue:=second^.next.next;
            sendtoend(second,secondlist);
            secondlist:=tempvalue;
          end;
        end;
      // ������� � ������� ��������
        if secondlist=nil then
          secondlist:=second^.next;

        inc(worktime);
        infoinput(first,firstlist,takttime);
        infoinput(second,secondlist,takttime);

    until litlcircle(second,secondlist,smallcircle,massfield);

  until endprocces(massField);
end;

  procedure main;
  begin
  //public
  ini;
  worktime:=0;
  inaction:=0;
  for j:=1 to 10 do
    for i:=1 to 10 do
    begin
      worktime:=0;
      inaction:=0;
      massfield:=Cmassfield;
      proccese(first,second,firstlist,secondlist,massField,j,i,worktime,inaction);
      AWorktime[j,i]:=worktime;
      Ainaction[j,i]:=inaction;
    end;
  readln;
  end;



end.
