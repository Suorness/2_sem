Program Po_opredel_predyclov_1;
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
  writeln(' |========================|');
  writeln(' |   X  |   Y   |   EPS   |');
  writeln(' |========================|');
  i:=0;
  //цикл по точности
  while(i<=2) do
  begin
    step:=1;
	  //цикл по шагам
    while(step<=21) do
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
      if x<=0 then
        writeln(' |', x:0:2,' |', y0:0:3,' |', Eps[i]:0:7 ,'|');
      if x>0 then
        writeln(' | ', x:0:2,' | ', y0:0:3,' |', Eps[i]:0:7 ,'|');
    x:=x+Step_X;
    step:=step+1;
    end;

    x:=early_X;
    writeln(' |========================|');
    i:=i+1;
  end;

  readln;
End.




