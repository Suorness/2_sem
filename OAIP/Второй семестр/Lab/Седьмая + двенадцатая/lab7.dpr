program lab7;

{$APPTYPE CONSOLE}

uses
  SysUtils,windows,
  methods_of_library in 'methods_of_library.pas',
  job_library in 'job_library.pas';

Const
  EPS:array[1..3] of real=(0.00001,0.000001,0.0000001);

Var
  Answer:real;
  i,j:integer;
  Part:integer;
  Total:array[1..2,1..6] of real;
Procedure calculation(Part:integer;LBorder,RBorder:real;Var ResultValue:real;
                      calc:TypeCalc;integral:TypeInt);
Var
  LengthOfPart:real;
  x:real;
begin
  LengthOfPart:=(RBorder-LBorder)/part;
  x:=LBorder;
  ResultValue:=calc(Part,LengthOfPart,x,integral)*LengthOfPart;
end;

Procedure Main(TypeCalculation:TypeCalc;Example:TypeInt;LBorder,RBorder:real;Eps:real;Var Answer:real;var Part:integer);
Var
  ValueInt,ValueIntPred:real;
  accuracy:real;

begin
  Part:=1;
  accuracy:=Eps+1;
  calculation(Part,LBorder,RBorder,ValueInt,TypeCalculation,Example);
  while abs(accuracy)>EPS do
  begin
    part:=part*3;
    ValueIntPred:=ValueInt;
    calculation(Part,LBorder,RBorder,ValueInt,TypeCalculation,Example);
    accuracy:=ValueInt-ValueIntPred;
  end;
  Answer:=ValueInt;
end;


begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  //Расчет значений
  for i:=1 to 3 do
  begin
    Main(RightRectangles,int_21_1,1.3,2.7,Eps[i],Answer,part);
    Total[1,i]:=Answer;
    Total[2,i]:=part;
  end;
  for i:=4 to 6 do
  begin
    Main(trapeze,int_21_1,1.3,2.7,Eps[i-3],Answer,part);
    Total[1,i]:=Answer;
    Total[2,i]:=part;
  end;

  //Вывод информации
  write('|');
  for i:=1 to 99 do
    write('-');
  write('|');
  writeln;
  write('|        |        Метод правых прямоугольников         |');
  write('        Метод трапеции                      |');
  writeln;
  write('|  Номер |');
  for i:=1 to 45 do
    write('-');
  write('|');
  for i:=1 to 44 do
    write('-');
  write('|');
  writeln;
  write('|интегрл.|  точность 1   | точность 2   | точность 3   |');
  write(' точность 1   | точность 2   | точность 3   |');
  writeln;
  write('|');
  for i:=1 to 99 do
    write('-');
  write('|');
  writeln;

  write('|  21.1  |');
  for i:=1 to 6 do
    if i=1 then
      write(total[1,i]:15:7,'|')
    else
    write(total[1,i]:14:7,'|');
  writeln;
  write('|        |');
  for i:=1 to 6 do
    if i=1 then
      write(total[2,i]:15:0,'|')
    else
    write(total[2,i]:14:0,'|');

  //Расчет значений
  for i:=1 to 3 do
  begin
    Main(RightRectangles,int_21_3,0.8,1.7,Eps[i],Answer,part);
    Total[1,i]:=Answer;
    Total[2,i]:=part;
  end;
  for i:=4 to 6 do
  begin
    Main(trapeze,int_21_3,0.8,1.7,Eps[i-3],Answer,part);
    Total[1,i]:=Answer;
    Total[2,i]:=part;
  end;

  //Вывод информации
   writeln;
  write('|');
  for i:=1 to 99 do
    write('-');
  write('|');
  writeln;
   write('|  21.3  |');
  for i:=1 to 6 do
    if i=1 then
      write(total[1,i]:15:7,'|')
    else
      write(total[1,i]:14:7,'|');

  writeln;
  write('|        |');
  for i:=1 to 6 do
    if i=1 then
      write(total[2,i]:15:0,'|')
    else
      write(total[2,i]:14:0,'|');

  writeln;
  write('|');
  for i:=1 to 99 do
    write('-');
  write('|');
  readln;
end.
        //интегрл.Номер
