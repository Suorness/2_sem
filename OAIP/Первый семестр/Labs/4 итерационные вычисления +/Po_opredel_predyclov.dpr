Program Po_opredel_predyclov_Laba4_1;
{$APPTYPE CONSOLE}
Uses
  SysUtils,
  windows;

Const
  Eps :array[0..2] of real = (0.00001,0.000001,0.0000001);


Var
  k,i,j,denominator,fact,step : integer;
  early_X,numerator,y0,y,r,Step_X,x : real;

Begin
  //подключение €зыка
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //ввод значений
  writeln('¬ведите начальный  X');
  readln(early_X);
  writeln('¬ведите шаг по X');
  readln(Step_X);
  x:=early_X;
  write(' |========================|');
  write(' |========================|');
  write(' |========================|');
  writeln;
  write(' |   X  |   Y   |   EPS1  |');
  write(' |   X  |   Y   |   EPS2  |');
  write(' |   X  |   Y   |   EPS3  |');
  writeln;
  write(' |========================|');
  write(' |========================|');
  write(' |========================|');
  writeln;
  step:=1;
  //цикл по точности
  while(step<=20) do
  begin
    i:=0;
	  //цикл по шагам
    while(i<=2) do
    begin
      r:=Eps[i]+1;
      k:=0;
      denominator:=1;
      y0:=x;
	    //расчет элемента
      while r>Eps[i] do
      begin
        k:=k+1;
        fact:=4*k+1;
        for j:=1 to fact do
          denominator:=denominator*j;
        numerator:=exp(fact*ln(abs(x)));
        y:=y0+numerator/denominator;
        r:=y-y0;
        y0:=y;
      end;

	    //вывод результатов

        write (' |', x:0:2,' |', y0:0:3,' |', Eps[i]:0:7 ,'|     ');

    i:=i+1;
    end;

    //writeln(' |========================|');
    step:=step+1;
     x:=x+Step_X;
  end;

  readln;
End.




