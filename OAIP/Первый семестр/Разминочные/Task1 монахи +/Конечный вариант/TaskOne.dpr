program TaskOne;

{$APPTYPE CONSOLE}
uses
  SysUtils,
  windows;

var
allM,allP,V,Pr,St,variant:integer;    a,b,c:real;
{����� ������� = allM,
 ����� ������� = allP,
 ������� ������ = V,
 ������� ������ = Pr
 ������� = St
 ���� ������� = �
 ���� ������� = b
 ���� ������� = �
 variant}
begin
  
  // ����������� �������� �����
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  variant:=0;
  // ���� �������� ������
  Writeln('������� ���������� �������');
  readln(allM);
  while (allM=0) or(allM<0) do
    begin
        Writeln('������');
        writeln('���������� ������� ������ ���� ������ ����');
        Writeln('��������� ����');
        Writeln('������� ���������� �������');
        readln(allM);
    end;
  Writeln('������� ���������� �������');
  readln(allP);
  while (allP=0) or(allP<0) do
    begin
        Writeln('������');
        writeln('���������� ������� ������ ���� ������ ����');
        Writeln('��������� ����');
        Writeln('������� ���������� �������');
        readln(allP);
    end;
  Writeln('������ ��� �������');
  writeln('������ ���� ������ ���������� �������');
  Writeln('������� ������� ������� ������� �����?');
  readln(a);
  while a<0 do
    begin
      Writeln('������! ��������� ����');
      readln(a);
    end;
  Writeln('������� ������� ������� ������� �����?');
      readln(b);
  while (a=b) or(b<0) do
    begin
        Writeln('������!');
        Writeln('��������� ����');
        Writeln('������� ������� ������� ������� �����?');
        readln(b);
    end;
  Writeln('������� ������� ������� ������?');
  readln(c);
  while (a=c) or (b=c) or(c<0)do
    begin
      Writeln('������!');
      Writeln('��������� ����');
      Writeln('������� ������� ������� ������?');
      readln(c);
       end;
  // ���� �� ������� �������
  //�� ���� �� ������������� ��������

  for Pr:=0 to allM do
    begin
      // ��������� ���������� ��������
      // ���������� ���������� ��� ��������� ����� ���������
      St:=trunc((allM*a-allP-(a-b)*Pr)/(a-c));
      // ��������� ���������� �������
      V:= allM-Pr-St;
     // �������� �� ���������� ������� �� ���������������
     //  � �������� ������� �� ������ ����������
       if (V>=0) and (St>=0) and (V*a+Pr*b+St*c=allP) then
       begin
          //���������� �������
          variant:= variant+1;
          Writeln('������� �',variant);
          writeln('������� ������ = ',V);
          writeln('������� ������ = ', Pr);
          writeln('������� ������ = ', St);
       end;
     end;
       // ���� ������� ���
  if variant=0 then
  writeln('��������� ���');
  readln;
end.



