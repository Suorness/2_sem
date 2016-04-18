Program Po_element_post_ysl_V_2;
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
  //����������� �����
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //���� ��������
  writeln('������� ���������  X');
  readln(early_X);
  writeln('������� ��� �� X');
  readln(Step_X);
  x:=early_X;
  write('|========================================|');
  write('|========================================|');
  write('|========================================|');
  writeln;
  write('|   X  |   Y   |   EPS1  |   K   | step  |');
  write('|   X  |   Y   |   EPS2  |   K   | step  |');
  write('|   X  |   Y   |   EPS3  |   K   | step  |');
  writeln;
  write('|========================================|');
  write('|========================================|');
  write('|========================================|');
  writeln;
  step:=1;
  //���� �� �����
  repeat
    i:=0;
	  //���� �� ��������
    repeat
      k:=0;
      denominator:=1;
      y0:=x;
	    //������ ��������
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

	    //����� �����������
      if step<10 then
      begin
        if x<=0 then
        begin
          write ('|', x:0:2,' |', y0:0:3,' |', Eps[i]:0:7);
          write('|   ', k,'   |', step,'      |');
        end
        else
        begin
          write ('| ', x:0:2,' | ', y0:0:3,' |', Eps[i]:0:7);
          write('|   ', k,'   |', step,'      |');
        end;
      end
      else
      begin
        if x<=0 then
        begin
          write ('|', x:0:2,' |', y0:0:3,' |', Eps[i]:0:7);
          write('|   ', k,'   |', step,'      |');
        end
        else
        begin
          write ('| ', x:0:2,' | ', y0:0:3,' |', Eps[i]:0:7);
          write('|   ', k,'   |', step,'     |');
        end;
      end;
      i:=i+1;
    until(i>2);
    writeln;
    step:=step+1;
    x:=x+Step_X;
  until (step>20);
  write('|========================================|');
  write('|========================================|');
  write('|========================================|');
  readln;
  readln;
End.




