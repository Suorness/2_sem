program TaskOne;

{$APPTYPE CONSOLE}
uses
  SysUtils;

var
Monax10, monax5, monax05:integer;

(* Monax10 - ���-�� �������, ������� ���� �� 10 � ������� �����
   monax5 -  ���-�� �������, ������� ���� �� 5 � ������� �����
   monax05 - ���-�� �������, ������� ���� �� 0.5  *)

begin
  for Monax10:= 0 to 10 do
       {���� ������� ����� ����� ������ 10, �� �������
        ������ �� ������� ������� ������}
    begin
      for monax5:=0 to 20 do
      {���� ������� ����� ����� ������ 20, �� �������
        ������ �� ������� ������� ������}
      begin
          monax05:=100-Monax10-monax5;     // ������� ������ �������
          if Monax10+monax5+monax05=100 then          //��� �������� �������
              if Monax10*10+monax5*5+monax05*0.5=100  then
              begin  // ����� �����������
                writeln ('Monaxi po 10 = ' ,Monax10);
                writeln ('Monaxi po 5 = ' ,monax5);
                writeln ('Monaxi po 0.5 = ' ,monax05);

              end;
      end;
    end;
readln;
end.


