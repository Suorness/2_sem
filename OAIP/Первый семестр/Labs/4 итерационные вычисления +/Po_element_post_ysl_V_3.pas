Program Po_element_post_ysl_V_3;
{$APPTYPE CONSOLE}
Uses
  SysUtils,
  windows;

Const
  Eps :array[0..2]of real = (0.0001,0.00001,0.000001);

Var
  k,i,j,denominator,fact,step : integer;
  numerator,y0,y,Step_X,x : real;
  test : boolean;
  znak,eps_y:integer;

Begin
  Step_X:=0.05;
  x:=-0.3;
  write('|=========================================|');
  write('|==========================================|');
  write('|===========================================|');
  writeln;
  write('|   X  |    Y   |   EPS1  |   K   | step  |');
  write('|   X  |    Y    |   EPS2  |   K   |  step |');
  write('|   X  |    Y     |   EPS3  |   K   | step  |');
  writeln;
  write('|=========================================|');
  write('|==========================================|');
  write('|===========================================|');
  writeln;
  step:=1;
  znak:=-1;
  //цикл по шагам
  repeat
    i:=0;
    eps_y:=4;
	  //цикл по точности
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
        if x<0 then
          numerator:=numerator*znak;
        y:=numerator/denominator;
        if y<eps[i] then
          test:=true;
        y:=y0+y;
        y0:=y;
      until (test);

	    //вывод результатов
      if step<10 then
      begin
        if x<=0 then
        begin
          write ('|', x:0:2,' |', y:0:eps_y,' | ', Eps[i]:0:6);
          write('|   ', k,'   |','   ', step,'   |');
        end
        else
        begin
          write ('| ', x:0:2,' | ', y:0:eps_y,' | ', Eps[i]:0:6);
          write('|   ', k,'   |','   ', step,'   |');
        end;
      end
      else
      begin
        if x<=0 then
        begin
          write ('|', x:0:2,' |', y:0:eps_y,' | ', Eps[i]:0:6);
          write('|   ', k,'   |','   ', step,'  |');
        end
        else
        begin
          write ('| ', x:0:2,' | ', y:0:eps_y,' | ', Eps[i]:0:6);
          write('|   ', k,'   |','   ', step,'  |');
        end;
      end;

		  i:=i+1;
      eps_y:=eps_y+1;

    until(i>2);
    writeln;
    step:=step+1;
    x:=x+Step_X;
  until (step>20);
  write('|=========================================|');
  write('|==========================================|');
  write('|===========================================|');
  readln;

End.




