program deikstrV2;

{$APPTYPE CONSOLE}
{}
uses
  SysUtils;

Const
//Количество вершин
  Size=6;
// бесконечно большое значение
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
{с процедурным смотреть другой файл
Решил сделать без тип-функций ибо код становится нечитабильным }

//матрица смежности графа
// 0 где нет пути
// если не 0 это размер дуги
Const
  MatrSM:TMatr =
  ((0,7,9,0,0,14),
   (7,0,10,15,0,0),
   (9,10,0,11,0,2),
   (0,15,11,0,6,0),
   (0,0,0,6,0,9),
   (14,0,2,0,9,0));

Var
//Массив посещений узла
  visit:TVisit;
// Длины путей
  way:TLen;
  i:integer;
  enterApex,endApex:integer;
  header:TList;
  List:TList;
procedure createWay(Title:TList;var List:Tlist;Str:string;leng:integer);
begin
  while list.next<>nil do
    list.next:=list;
  new(list.next);
  list:=list.next;
  list.way:=str;
  list.leng:=leng;
  list.next:=nil;
end;

procedure waystart(firstH:integer;Var way:TLen);
Var
  i:integer;
begin
  for i:=1 to Size do
      way[i]:=MORE;

  way[FirstH]:=0;
end;

procedure WayStartMax(firstH:integer;Var way:TLen);
Var
  i:integer;
begin
  for i:=1 to Size do
      way[i]:=0;

  way[FirstH]:=More;
end;


procedure  visitfalse(Var viset:TVisit);
Var
  i:integer;
begin
  for i:=1 to size do
    viset[i]:=false;
end;

//возращает индекс минимальной вершины из еще не посещенных

function Determine_branch(Way:TLen;visit:TVisit):integer;
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
        if way[result]>way[i] then
        begin
          result:=i;
        end;
      end;
    end;
  end;
end;



//apex-входная вершина
procedure Compare_Ways(apex:integer;var way:TLen;var visit:TVisit);
Var
  i:integer;
begin
  for i:=1 to size do
  begin
    if MatrSM[apex,i]<>0 then
    begin
      if way[i]>way[apex]+MatrSM[apex,i] then
      begin
        way[i]:=way[apex]+MatrSM[apex,i];
      end;
    end;
  end;
  visit[apex]:=true;
end;

procedure Compare_Ways_Max(apex:integer;var way:TLen;var visit:TVisit);
Var
  i:integer;
begin
  for i:=1 to size do
  begin
    if MatrSM[apex,i]<>0 then
    begin
      if way[i]<way[apex]+MatrSM[apex,i] then
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

procedure deikstra(enterPoint:integer; var visit:TVisit);
begin
  waystart(enterPoint,way);
  Compare_Ways(enterPoint,way,visit);
  while not allvisit(visit) do
    Compare_Ways(Determine_branch(way,visit),way,visit);
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
        createWay(Header,list,str+'->'+inttostr(firstpoint)+'->'+inttostr(i),leng+MatrSM[firstpoint,i])
        //writeln(str+inttostr(firstpoint)+inttostr(i),' ',leng+MatrSM[firstpoint,i])
      else
      begin
        visit[firstpoint]:=true;
        obxod(i,endpoint,visit,way,str+'->'+inttostr(firstpoint),leng+MatrSM[firstpoint,i]);
      end;
    end;
  end;
end;

procedure createMas(title,list:TList);
Var
  Mass:array of TTList;
  countItem,j:integer;
  temp:TTList;
begin
  countItem:=0;
  list:=title.next;
  while list<>nil do
  begin
    inc(countItem);
    list:=list.next;
  end;
  SetLength(Mass,countItem);
  list:=header.next;
  for j:=0 to countItem-1 do
  begin
    Mass[j]:=list^;
    list:=list.next;
    mass[j].next:=nil;
  end;

  for i:=0 to countItem-1 do
  begin
    for j:=0 to countItem-i-2 do
    begin
      if mass[j].leng>mass[j+1].leng then
      begin
        temp:=mass[j+1];
        mass[j+1]:=mass[j];
        mass[j]:=temp;
      end;
    end;
  end;
  writeln('Max distance ',mass[countItem-1].leng);
  writeln;
  writeln('All the way');
  for j:=0 to countItem-1 do
  begin
    writeln(mass[j].way:18,' ',mass[j].leng:3);
  end;
end;

procedure SearchCentr(var way:Tlen; var Visit:TVisit);
Var
  i:integer;
  mass_Max_distanse:array[1..Size] of integer;
  max,min,j:integer;
begin
  for i:=1 to Size do
  begin
    visitfalse(visit);
    deikstra(i,visit);
    max:=1;

    for j:=2 to Size do
      if way[j]>way[max] then
        max:=j;

    mass_Max_distanse[i]:=way[max];
  end;
   min:=1;
   for j:=2 to Size do
    if mass_Max_distanse[j]<mass_Max_distanse[min] then
      min:=j;
   writeln;
   writeln('Count Centre ', min);
end;

begin
  new(header);
  List:=header;
  list.next:=nil;
  Writeln('Enter the starting point');
  readln(enterApex);
  Writeln('Enter the endpoint');
  readln(endApex);
  if (enterApex<>endApex) and ((enterApex<=Size) and (endApex<=Size)) then
  begin
    visitfalse(visit);
    deikstra(enterApex,visit);
    writeln;
    writeln('Min distanse ',way[endApex]);
    writeln;
    visitfalse(visit);
    obxod(enterApex,endApex,visit,way,'',0);
    createMas(header,list);
    SearchCentr(way,visit);
  end
  else
    writeln('You have entered the path of the point of the nail');
  readln;
end.
