Program Task3;
{$APPTYPE CONSOLE}
Uses
SysUtils,windows;
Var
  cost,PlusD:real;
  disk,kit,box,bonus:integer;
{cost = ���������� ����
 kit - ������� �� 12 ������
 box -���� �� 12*12 ������
 PlusD ������ � ����
 disk ���������� ������
 bonus ���������� ������ ���������� � �������� ������}

begin
  // ����������� �������� �����
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  // ���� ������
  writeln('������� ���������� ������');
  readln(disk);
  bonus:=0;
  // �������� �� ���������������
  while disk<0 do
  begin
    writeln('������!');
    writeln('��������� ����');
    readln(disk);
  end;
  // ������ ������ ����
  PlusD:=disk*11.5;
  //������ ������
  box:=(disk div 144);
  disk:=disk-box*144;
  if disk>=130 then
  begin
    box:=box+1;
    bonus:=144-disk;
    disk:=0;
  end;
  //������ �������
  kit:= disk div 12;
  disk:=disk-kit*12;
  if disk>=10 then
  begin
    kit:=kit+1;
    bonus:=12-disk;
    disk:=0;
  end;
  //������ ����
  cost:=box*1255+kit*114.5+disk*11.5;
  //������ ������
  PlusD:=PlusD-cost;
  writeln('�������� ���� ',cost:0:1);
  writeln('���������� ������ ', box);
  writeln('���������� ������� ', kit);
  writeln('���������� ������ ',disk);
  writeln('���������� �������� ������ ',bonus);
  writeln('������� � ��������� ',PlusD:0:1);
  readln;
end.
