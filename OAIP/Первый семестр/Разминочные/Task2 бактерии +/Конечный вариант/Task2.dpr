program Task2;
{$APPTYPE CONSOLE}
uses
  Windows,
  SysUtils;

var
Red,Green,M,N:int64;
i,cycle:longint;
{ N � M ������������� ���������
  Red - �������� �������
  Green - �������� �������
  i- ������� �����, cycle ���-�� ��������� }
begin
  SetConsoleOutputCP(1251); // ����������� �������� �����
  SetConsoleCP(1251);
  repeat  //���� ��� �������� �� ���������������
    Writeln('������� ����� ������� ��������');
    readln(green); //���� �������
    if green<0 then
    Writeln('��������� ����, �������� ������ ���� �������������');
  until green>=0;
  repeat   //���� ��� �������� �� ���������������
    Writeln('������� ����� ������� ��������');
    readln(red);  //���� �������
    if red<0 then
    Writeln('��������� ����, �������� ������ ���� �������������');
  until red>=0;
  repeat   //���� ��� �������� �� ���������������
    writeln('������� ����� ������');
    readln(cycle); // ���� ���-�� ������
    if cycle<0 then
    Writeln('��������� ����, �������� ������ ���� �������������');
  until cycle>=0;
  for i:=1 to cycle do
  begin            //������ ����� ��������
    N:=red;
    red:=0;
    M:=green;
    green:=0;
    red:=M;
    green:=M+N;
    N:=0;
    M:=0;
  end;
  writeln('������� = ', red);   //����� �����������
  Writeln('������� = ', green);
  Writeln('����� =  ', green+red);
  readln;
end.
 