program deikstr;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
//���������� ������
  Size=5;
// ���������� ������� ��������
//
  MORE=99999;
Type
  TMatr=array[1..Size,1..Size] of integer;
  TVisit=array[1..Size] of boolean;
  TLen=array[1..Size] of  integer;
  TSearch = function (i,apex:integer;Var way:TLen):boolean;
  TSearch_Comp = function (i,value:integer;way:Tlen):boolean;
//������� ��������� �����
// 0 ��� ��� ����
// ���� �� 0 ��� ������ ����
Const
  MatrSM:TMatr =
  ((0,10,30,50,10),
  (0,0,0,0,0),
  (0,0,0,0,10),
  (0,40,20,0,0),
  (0,0,0,30,0));

Var
//������ ��������� ����
  visit:TVisit;
// ����� �����
  way:TLen;
  i:integer;

procedure waystart(firstH:integer;Var way:TLen;Max_s:boolean);
Var
  i:integer;
begin
  for i:=1 to Size do
  begin
    if Max_s then
    begin
      way[i]:=0;
    end
    else
      way[i]:=MORE
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
procedure Compare_Ways(apex:integer;var way:TLen;var visit:TVisit;Max_or_min:TSearch);
Var
  i:integer;
begin
  for i:=1 to size do
  begin
    if MatrSM[apex,i]<>0 then
    begin
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
// max_min_fl = true max
//           false = min
procedure deikstra(first:integer; var visit:TVisit;Max_or_min:TSearch;max_min_fl:boolean);
begin

  waystart(first,way,max_min_fl);  //��������� ������� � ������� �����
  Compare_Ways(first,way,visit,Max_or_min);
  while not allvisit(visit) do
  begin
    if max_min_fl then
      Compare_Ways(Determine_branch(way,visit,ifmax_v),way,visit,Max_or_min)
    else
      Compare_Ways(Determine_branch(way,visit,ifmin_v),way,visit,Max_or_min)
  end;
end;

begin
  writeln('Max distanse');
  visitfalse(visit);
  deikstra(1,visit,max_way_comp,true);
  for i:=1 to size do
    write(way[i], ' ');
  writeln('Min distanse');
  visitfalse(visit);
  deikstra(1,visit,min_way_comp,false);
  for i:=1 to size do
    write(way[i], ' ');
  readln;
end.
