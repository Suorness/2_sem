Program Slojeniepac;
{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Var str0,str1,str2:string;
    sim0,sim1,sim2,a,b,c,i,k,g:integer;
    sim:char;
{str0-�������� ���������
 str1-������ �����
 str2-������ �����
 sim0-���������� �������� 3 ������
 sim1-���������� �������� ������ ������
 sim2-���������� �������� ������ ������
 �,b,c- ������������� ��������, ������� ��������� ��� ������ �������
 k-����������� ������� ��� ��������
 g-�������� �����
 sim-���������� ��� ���������� �����, ��� ���������� �������     }
Begin
  //��������� ������� ����
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //������ 2 �����
  writeln('������� ������ �����');
  readln(str1);
  writeln('������� ������ �����');
  readln(str2);
  // ������� ���������� ��������
  sim1:=length(str1);
  sim2:=length(str2);
  sim0:=0;
 (*��������  ������������ ���������� ��������
   �������� ������ � ����������� ���������� �������
   �� ������ ������*)
  if sim1>sim2 then
  begin
    sim0:=sim1;
    g:=sim1-sim2;
    for i:=1 to g do
    str2:='0'+str2;

  end;
  if sim1<sim2 then
  begin
    sim0:=sim2;
    g:=sim2-sim1;
    for i:=1 to g do
    str1:='0'+str1;
    str0:=str2;
  end;
  if sim1=sim2 then
  sim0:=sim1;
  str0:=str2;

  //��������������  ������ �����
  for i:=1 to (length(str1) div 2) do
  begin
    sim:=str1[i];
    str1[i]:=str1[length(str1)-i+1];
    str1[length(str1)-i+1]:=sim;
  end;
  //��������������  ������ �����
  for i:=1 to (length(str2) div 2) do
  begin
    sim:=str2[i];
    str2[i]:=str2[length(str2)-i+1];
    str2[length(str2)-i+1]:=sim;
  end;
  k:=0;
  // �������� ���������� �����
  for i:=1 to sim0 do
  begin
    //����������� ���� ������ ������ � �����
    a:=strtoint(str1[i]);
    b:=strtoint(str2[i]);
    //���������� �����
    c:=b+a+k;
    k:=0;
    // �������� �� ����������� ������ �������
    if (i=sim0) and (c>=10) then
    str0:=str0+'1';
    //�������� �� ������� �������
    if c>=10 then
    begin
      k:=1;
      c:=c-10;
    end;
    //����������� ������ � ���� ������ ������
    str0[i]:=inttostr(c)[1];
  end;
  //�������������� ����� � �������� �����
  for i:=1 to (length(str0) div 2) do
  begin
    sim:=str0[i];
    str0[i]:=str0[length(str0)-i+1];
    str0[length(str0)-i+1]:=sim;
  end;
  writeln('��������� ��������');
  writeln(str0);
  readln;
readln;
end.
