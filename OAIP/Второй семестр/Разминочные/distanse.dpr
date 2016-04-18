Program distanse;

{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Type
  TArray = array [1..2, 1..10] of real;

Const
  ARrayC: TArray = ((145,33,33,122,78,126,125,114,126,138),  {X}
                    (112,168,162,58,98,82,93,-58,-28,-62));    {Y}

Var
  i:integer;
  Eps,total,TotalDistanse:real;
function LeftBorder(AnyARrayC:TArray):real;
Var
  i:integer;
begin
  result:=AnyARrayC[1,1];
  for i:=2 to 10 do
    if result>AnyARrayC[1,i] then
      result:=AnyARrayC[1,i];
end;

function RightBorder(AnyARrayC:TArray):real;
var
  i:integer;
begin
  RightBorder:=AnyARrayC[1,1];
  for i:=2 to 10 do
    if result<AnyARrayC[1,i] then
      result:=AnyARrayC[1,i];
end;

function MaxDistance(x:real;AnyARrayC:TArray):real;
var
  i:integer;
  Distance:real;
begin
  result:=0;
  for i:=1 to 10 do
  begin
    Distance:= sqrt(sqr(x-AnyARrayC[1,i])+sqr(0-AnyARrayC[2,i]));
    if result<Distance then
      result:=Distance;
  end;
end;

procedure main(Eps,LeftB,RightB:real;AnyARrayC:TARray; var total,
                TotalDistanse:real);
var
  point,newDistance:real;


begin
  TotalDistanse:=MaxDistance(LeftB,AnyARrayC);
  total:=LeftB;
  point:=LeftB;
  while point <= RightB do
  begin
    newDistance:=MaxDistance(point,AnyARrayC);
    if newDistance<TotalDistanse then
    begin
      TotalDistanse:=newDistance;
      total:=point;
    end;
    point:=point+Eps;
  end;
end;

begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  writeln('Введите шаг приращения');
  readln(Eps);
  main(Eps,LeftBorder(ARrayC),RightBorder(ARrayC),
        ARrayC,total,totaldistanse);
  writeln('Найденная точка с координатами (', total:0:2,':0)');
  writeln('Расстояние ', totaldistanse:0:2);
 readln;
end.
