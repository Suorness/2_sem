program Task2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
Red,Green,GreenN,N,i,cycle:cardinal;
//N промежуточный множетель
//  greenN ѕромежуточные вычислени€
// i- счетчик циклов, cycle кол-во поторений
begin
  green:=0;
  N:=1;
  Writeln('Enter the number of red');
  readln(red);  //ввод кол-во красных
  writeln('Enter the number of cycles');
  readln(cycle); // ввод кол-во циклов
  for i:=1 to cycle do
  begin            //расчет новых значений
    N:=red;
    red:=0;
    greenN:=N;
    red:=2*green;
    green:= green+greenN;
    N:=0;
  end;
  writeln('Red = ', red);
  Writeln('Green = ', green);
  Writeln('Green+Red =  ', green+red);
  readln;
end.
 