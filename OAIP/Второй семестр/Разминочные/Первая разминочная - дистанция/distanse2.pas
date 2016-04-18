Program distanse2;

{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Type
  TArray = array [1..2, 1..10] of real;

Const
  ARrayC: TArray = ((145,133,33,122,78,126,125,114,126,138),  {X}
                    (112,168,162,58,98,82,93,-58,-28,-62));    {Y}

Var
  Eps,total,TotalDistanse:real;
  left,right:real;

{Алгоритм поиска правой и левой границы}
procedure Border(TestArrayC:TArray;var left:real; var right:real);
var
  i:integer;
begin
  left:=TestArrayC[1,1];
  right:=TestArrayC[1,1];
  for i:=1 to 10 do
  begin
    if right<TestArrayC[1,i] then
      right:=TestArrayC[1,i];

    if left>TestArrayC[1,i] then
      left:=TestArrayC[1,i];
  end;

end;

{Алгоритм расчета расстояния }
procedure MaxDistance(x:real;AnyARrayC:TArray; Var outCount:real);
var
  i:integer;
  Distance:real;
begin
  outCount:=0;
  for i:=1 to 10 do
  begin
    Distance:= sqrt(sqr(x-AnyARrayC[1,i])+sqr(0-AnyARrayC[2,i]));
    if outCount<Distance then
      outCount:=Distance;
  end;
end;

{Алгоритм Рассчета основных значений}
procedure main(Eps,LeftB,RightB:real;AnyARrayC:TARray; var total,
                TotalDistanse:real);
var
  point,newDistance:real;

begin
  MaxDistance(LeftB,AnyARrayC,TotalDistanse);
  total:=LeftB;
  point:=LeftB;
  {Идем по прирощени Eps до правой границы}
  while point <= RightB do
  begin
    MaxDistance(point,AnyARrayC,newDistance);
    if newDistance<TotalDistanse then
    begin
      TotalDistanse:=newDistance;
      total:=point;
    end;
    point:=point+Eps;
  end;
end;

{Финальные вывод результатов}
procedure endwrite(total:real;totaldistanse:real);
begin
  writeln('Найденная точка с координатами (', total:0:2,':0)');
  writeln('Расстояние ', totaldistanse:0:2);
end;

{Ввод исходных значений}
procedure enterFirstCount(Var Eps:real);
begin
  writeln('Введите шаг приращения');
  readln(Eps);
end;

Begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  enterFirstCount(Eps);
  Border(ARrayC,Left,right);
  main(Eps,Left,Right,ARrayC,total,totaldistanse);
  endwrite(total,totaldistanse);
 readln;
End.
