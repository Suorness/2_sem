program Lab_One_V_two;
{$APPTYPE CONSOLE}
uses
  SysUtils,windows;
Var x,y,h,d,sum:extended;
    n:integer;
    {h- ��� �� � �� D
    D- �������� �}
begin
  // ����������� �������� �����
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  // ��������� �������� �
  writeln('������� X');
  readln(x);
  while x<0 do
    begin
      writeln('��������� ���� X');
      writeln('������� X');
      readln(x);
    end;
  writeln('������� ��� h');
  readln(h);
  while h<0 do
    begin
      writeln('��������� ���� h');
      writeln('������� h');
      readln(h);
    end;
   writeln('������� ��������  X');
  readln(D);
  while D<x do
    begin
      writeln('��������� ���� D');
      writeln('D ������ ���� ������ X');
      writeln('������� D');
      readln(D);
    end;

  while x<d do  //������� �� �
  begin
    sum:=0;
    for n:=1 to 15 do
    begin
      sum:=sum+(Ln(sqrt(sqr(x))))/(2-1/n);   // ������ �����
      if n>=10 then
      begin
        y:=n*sqrt(n*x)*(exp(ln(x)*(2/3)))+sum;  // ������ y
        write('n=', n);
        write('   x=', x:1:2);
        write('   y=', y:5:3);
        writeln;
      end;
    end;
  x:=x+h;
  end;
  readln;
end.
