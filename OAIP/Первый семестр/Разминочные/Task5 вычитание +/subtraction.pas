Program subtraction;
{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Const
  ten=10;
  fifty=50;
  null=48;

Var
  str1,str2,str3 : string[fifty];
  ARstr1,ARstr2,ARstr3 : array[1..fifty] of integer;
  sim1,sim2,sim3 : integer;
  Zamena,rank,test_null,test : boolean;
  sim : char;
  i,g : integer;
Begin
  //���������� ������� ����
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //������ 2 ����� � ��������� �� ���������������
  repeat
    writeln('������� ������ �����');
    readln(str1);
    test:=true;
    for i:=1 to length(str1) do
    begin
      if (ord(str1[i])<48) or (ord(str1[i])>58) then
        test:=false;
    end;
    if test=false then
      writeln('������ �����, ��������� ����');
  until test=true;

  repeat
    writeln('������� ������ �����');
    readln(str2);
    test:=true;
    for i:=1 to length(str2) do
    begin
      if (ord(str2[i])<48) or (ord(str2[i])>58) then
        test:=false;
    end;
    if test=false then
      writeln('������ �����, ��������� ����');
  until test=true;

  // ������� ����� �����
  sim1:=length(str1);
  sim2:=length(str2);
  // ��������� �������� ������
  Zamena:=false;
  rank:=false;
  test_null:=false;
  sim3:=0;
  //�������������� ������ ��� �������� � ������
  // ��������� �������
  if sim1=sim2 then
  begin
    sim3:=sim2;
    if str1>str2 then
    zamena:=false
    else
    zamena:=true;
    if str1=str2 then
    begin
      zamena:=false;
      test_null:=true;
    end;
  end;
  // ��������� �������
  if sim1>sim2 then
  begin
    zamena:=false;
    g:=sim1-sim2;
    for i:=1 to g do
      str2:='0'+str2;
    sim3:=sim1;
  end;
  // ��������� �������
  if sim1<sim2 then
  begin
    zamena:=true;
    g:=sim2-sim1;
    for i:=1 to g do
      str1:='0'+str1;
    sim3:=sim2;
  end;
  //�������������� ������ ��� �������� ����������
  for i:=1 to (length(str1) div 2) do
  begin
    sim:=str1[i];
    str1[i]:=str1[length(str1)-i+1];
    str1[length(str1)-i+1]:=sim;
  end;
  
  for i:=1 to (length(str2) div 2) do
  begin
    sim:=str2[i];
    str2[i]:=str2[length(str2)-i+1];
    str2[length(str2)-i+1]:=sim;
  end;
  //��������� � ������
  if zamena=false then
  begin
    for i:=1 to sim1 do
    begin
      ARstr1[i]:=strtoint(str1[i]);
      ARstr2[i]:=strtoint(str2[i]);
    end;
  end;
  //��������� � ������
  if zamena then
  begin
    for i:=1 to sim2 do
    begin
      ARstr1[i]:=strtoint(str2[i]);
      ARstr2[i]:=strtoint(str1[i]);
    end;
  end;
  //�������� ������
  for i:=1 to sim3 do
  begin
    if ARstr1[i]<ARstr2[i] then
      rank:=true;
    if rank then
    begin
      ARstr3[i]:= ten+ARstr1[i]-ARstr2[i];
      ARstr1[i+1]:=ARstr1[i+1]-1;
    end;
    if rank=false then
      ARstr3[i]:= ARstr1[i]-ARstr2[i];
    rank:=false;
  end;

  str3:='';
  //��� �������� ������ ����������� ������ � ������
  for i:=1 to fifty do
  begin
    str3:=str3+inttostr(ARstr3[i]);
  end;
  //�������������� ������ ��� ������
  // ���������� � ��������� ���
  for i:=1 to (length(str3) div 2) do
  begin
    sim:=str3[i];
    str3[i]:=str3[length(str3)-i+1];
    str3[length(str3)-i+1]:=sim;
  end;
  // �������� �� ����
  while (ord(str3[1])=null) do
  begin
    for i:=1 to length(str3) do
      str3[i]:=str3[i+1];
  end;
 
  write('��������� ��������� = ');
  //�������� ������
  if test_null then
    writeln('0');
  if zamena then
    writeln('-',str3)
  else
    writeln(str3);
  readln;
  end.



