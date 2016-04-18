Program Po_element_post_ysl_LB_4_2;
{$APPTYPE CONSOLE}
Uses
  SysUtils,
  windows;

Const
  Eps :array[0..2]of real = (0.00001,0.000001,0.0000001);

Var
  k,i,j,denominator,fact,step : integer;
  early_X,numerator,y0,y,Step_X,x : real;
  test : boolean;

Begin
  //подключение языка
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //ввод значений
  writeln('Введите начальный  X');
  readln(early_X);
  writeln('Введите шаг по X');
  readln(Step_X);
  x:=early_X;
  writeln(' |========================|');
  writeln(' |   X  |   Y   |   EPS   |');
  writeln(' |========================|');
  i:=0;
  //цикл по точности
  repeat
    step:=1;
	  //цикл по шагам Х
    repeat
      k:=0;
      denominator:=1;
      y0:=x;
	    //расчет элемента
      repeat
        test:=false;
        k:=k+1;
        fact:=4*k+1;
        for j:=1 to fact do
          denominator:=denominator*j;
        numerator:=exp(fact*ln(abs(x)));
        y:=numerator/denominator;
        if y<eps[i] then
          test:=true;
        y:=y0+y;
        y0:=y;
      until (test);

	    //вывод результатов
      if x<0 then
        writeln(' |', x:0:2,' |', y0:0:3,' |', Eps[i]:0:7 ,'|');
      if x>0 then
        writeln(' | ', x:0:2,' | ', y0:0:3,' |', Eps[i]:0:7 ,'|');
      x:=x+Step_X;
      step:=step+1;
    until (step>21);
    x:=early_X;
    writeln(' |========================|');
    i:=i+1;
  until(i>2);

  readln;
End.




