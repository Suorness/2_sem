Program kri;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Var
  countKri,countProcces:integer;
  outStr:string;

procedure mainbody(countKri:integer;outstr:string; var countProcces:integer);
begin
  if (countKri = 2) or (countKri = 4) then
    mainbody(countKri-2,outStr+'�',countProcces)
  else
    if (countKri=3)then
      mainbody(countKri-3,outStr+'�',countProcces)
    else
      if countKri=0 then
      begin
        inc(countProcces);
        writeln(outStr);
      end
      else
      begin
        mainbody(countKri-2,outStr+'�',countProcces);
        mainbody(countKri-3,outStr+'�',countProcces);
      end;
end;


begin
  {����������� �����}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  {���� ���������� ��������}
  writeln('������� ���������� �������:');
  readln(countKri);
  countProcces:=0;
  outStr:='';
  mainbody(countKri,outStr,CountProcces);
  writeln('���������� ��������� ����: ', CountProcces);
  readln;
end.
