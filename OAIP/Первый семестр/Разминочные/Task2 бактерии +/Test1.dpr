program Test1;

{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils;

var A,B,C:integer;
begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  repeat
    
      writeln('������� ����� �������');
      readln(a);
      if a<0 then
      writeln('��������� ����');
   Until a>0;
  Writeln('=',a);
  readln;
end.
 