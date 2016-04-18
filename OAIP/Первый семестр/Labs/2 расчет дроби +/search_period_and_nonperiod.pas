Program search_period_and_nonperiod;

{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Const
  ten=10;
Var
  denominator0,numerator0 : string;
  period,nonperiodic : string;
  numerator,denominator : integer;
  numerator1,numerator2 : integer;
  step,origin,i : integer;
  division_step,division_step1 : integer;
  assay,test,test0 : boolean;
Begin
  //����������� �������� �����
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  //���� ��������
  repeat
    repeat
      writeln('������� ���������');
      readln(numerator0);
      test:=true;
      for i:=1 to length(numerator0) do
      begin
        if (ord(numerator0[i])<48) or (ord(numerator0[i])>58) then
          test:=false;
      end;
      if test=false then
        writeln('�� ����� ������������ ������, ��������� ����');
    until test=true;

    numerator:=strtoint(numerator0);
    numerator1:=numerator;

    repeat
      writeln('������� �����������');
      readln(denominator0);
      test:=true;
      for i:=1 to length(denominator0) do
      begin
        if (ord(denominator0[i])<48) or (ord(denominator0[i])>58) then
          test:=false;
      end;
      if test=false then
        writeln('�� ����� ������������ ������, ��������� ����');
    until test=true;

    denominator:=strtoint(denominator0);
    test0:=true;

    if numerator>=denominator then
    begin
      test0:=false;
      writeln('�� ����� ������������ ������, ��������� ����');
    end;
  until test0;

  //��������� ��������� ��������
  step:=1;
  origin:=0;
  nonperiodic:='';
  period:='';

  // ������ �������
  while(step <= denominator) or (origin <> numerator) do
  begin
    if step = denominator then
      origin:= numerator;
    division_step:=ten*numerator div denominator;
    numerator:=ten*numerator mod denominator;
    if step >= denominator then
    begin
      period:=period + inttostr(division_step);
    end;
    step:=step+1;
  end;

  //������ ��������������� �����
  repeat
    division_step:=ten*numerator1 div denominator;
    numerator1:=ten*numerator1 mod denominator;
    if division_step <> strtoint(period[1]) then
    begin
      nonperiodic:= nonperiodic + inttostr(division_step);
    end;
    {��������� �������� ����� ��� ����,
     ����� ���������, ��� ��������������� �����
     ������������� ����������� }
    if division_step = strtoint(period[1]) then
    begin
      numerator2:=numerator1;
      division_step1:=division_step;
      assay:=true;
      for i:=1 to length(period) do
      begin
        if division_step1 <> strtoint(period[i]) then
          assay:=false;

        division_step1:=ten*numerator2 div denominator;
        numerator2:=ten*numerator2 mod denominator;
      end;
    end;
    if (assay=false) and (division_step = strtoint(period[1]))  then
      nonperiodic:= nonperiodic + inttostr(division_step);

  until assay=true;

  //����� �����������
  writeln;
  writeln('0.',nonperiodic,'(',period,')');
  if nonperiodic>'' then
    writeln('��������������� ����� = ', nonperiodic);
  writeln('������������� ����� = ', period);
  readln;
end.
