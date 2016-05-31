program deikstr;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
//���������� ������
  Size=6;
// ���������� ������� ��������
//
  MORE=99999;
Type
  TMatr=array[1..Size,1..Size] of integer;
  TVisit=array[1..Size] of boolean;
  TLen=array[1..Size] of  integer;
  TSearch = function (i,apex:integer;Var way:TLen):boolean;
  TSearch_Comp = function (i,value:integer;way:Tlen):boolean;
  TList=^TTlist;
  TTlist= record
    way:string;
    leng:integer;
    next:TList;
    end;
//������� ��������� �����
// 0 ��� ��� ����
// ���� �� 0 ��� ������ ����
Const
  MatrSM:TMatr =
  ((0,7,9,0,0,14),
   (7,0,10,15,0,0),
   (9,10,0,11,0,2),
   (0,15,11,0,6,0),
   (0,0,0,6,0,7),
   (14,0,2,0,9,0));
  {((0,10,30,50,10),
  (0,0,0,0,0),
  (0,0,0,0,0),
  (0,40,20,0,0),
  (0,0,0,30,0));  }
Var
//������ ��������� ����
  visit:TVisit;
// ����� �����
  way:TLen;
  i:integer;
  j:integer;
  header:TList;
  List:TList;

procedure createWay(Title:TList;var List:Tlist);
begin
  while list.next<>nil do
    list.next:=list;
  new(list.next);
  list:=list.next;
end;

procedure obxod(firstPoint,endpoint:integer;visit:TVisit;way:TLen;str:string;leng:integer);
Var
  i:integer;
begin

  for i:=1 to Size do
  begin
    if (not visit[i]) and (MatrSM[firstpoint,i]<>0)then
    begin
      if i=endpoint then
        writeln(str+inttostr(firstpoint)+inttostr(i),' ',leng+MatrSM[firstpoint,i])
      else
      begin
        visit[firstpoint]:=true;
        obxod(i,endpoint,visit,way,str+inttostr(firstpoint),leng+MatrSM[firstpoint,i]);
      end;
    end;
  end;
end;

procedure waystart(firstH:integer;Var way:TLen;Max_s:boolean);
Var
  i:integer;
begin
  for i:=1 to Size do
  begin
    if Max_s then          //��� ���
    begin
      way[i]:=0;
    end
    else
      way[i]:=MORE     //��� min
  end;
  way[FirstH]:=0;
end;

procedure  visitfalse(Var viset:TVisit);
Var
  i:integer;
begin
  for i:=1 to size do
    viset[i]:=false;
end;
//��������� ������ ����������� ������� �� ��� �� ����������

function ifmin_v(i,value:integer;way:Tlen):boolean;
begin
  result:=false;
  if way[value]>way[i] then
    result:=true
end;

function ifmax_v(i,value:integer;way:Tlen):boolean;
begin
  result:=false;
  if way[value]<way[i] then
    result:=true
end;


function Determine_branch(Way:TLen;visit:TVisit;Compere:TSearch_Comp):integer;
Var
  firstEntr:boolean;
  i:integer;
begin
  firstEntr:=true;
  for i:=1 to Size do
  begin
    if not visit[i] then
    begin
      if firstEntr then
      begin
        result:=i;
        firstEntr:=not firstEntr;
      end
      else
      begin
        if Compere(i,result,way) then
        begin
          result:=i;
        end;
      end;
    end;
  end;
end;

function min_way_comp(i,apex:integer;Var way:TLen):boolean;
begin
  result:=false;
  if way[apex]+MatrSM[apex,i]<way[i] then
    result:=true;
end;

function max_way_comp(i,apex:integer;Var way:TLen):boolean;
begin
  result:=false;
  if way[apex]+MatrSM[apex,i]>way[i] then
    result:=true;
end;

//apex-������� �������
procedure Compare_Ways(apex:integer;var way:TLen;var visit:TVisit;Max_or_min:TSearch;var noway:boolean);
Var
  i:integer;
begin
  noway:=true;
  for i:=1 to size do
  begin
    if MatrSM[apex,i]<>0 then
    begin
      noway:=false;
      if Max_or_min(i,apex,way) then
      begin
        way[i]:=way[apex]+MatrSM[apex,i];
      end;
    end;
  end;
  visit[apex]:=true;
end;

function Allvisit(visit:TVisit):boolean;
Var
  I:integer;
begin
  result:=true;
  for i:=1 to size do
    if not visit[i] then
      result:=false;
end;
// max_min_fl = true =  max
//              false = min
procedure deikstra(first:integer; var visit:TVisit;Max_or_min:TSearch;max_min_fl:boolean);
Var
  noway:boolean;
  i:integer;
begin

  waystart(first,way,max_min_fl);  //��������� ������� � ������� �����
  Compare_Ways(first,way,visit,Max_or_min,noway);
  if not noway then
  begin
    while not allvisit(visit) do
    begin
      if max_min_fl then
        Compare_Ways(Determine_branch(way,visit,ifmax_v),way,visit,Max_or_min,noway)
      else
        Compare_Ways(Determine_branch(way,visit,ifmin_v),way,visit,Max_or_min,noway)
    end;
  end
  else
  begin
    for i:=1 to Size do
    begin
      way[i]:=0;
    end;
  end;

end;

begin
  new(header);
  List:=header;
  list.next:=nil;
  for j:=1 to Size do
  begin
  writeln('apex ',j);
  writeln('Max distanse');
  visitfalse(visit);
  deikstra(j,visit,max_way_comp,true);
   for i:=1 to size do
    write(way[i], ' ');
  writeln;
  writeln('Min distanse');
  visitfalse(visit);
  deikstra(j,visit,min_way_comp,false);
  for i:=1 to size do
    write(way[i], ' ');
  writeln;
  //readln;
  end;
  visitfalse(visit);
  obxod(2,1,visit,way,'',0);
  readln;
end.
