unit data_output;

interface
  procedure writeResult(SetAbSence:TSet);

implementation
procedure writeResult(SetAbSence:TSet);
Var
 i:integer;
 ch:char;
 Nothing:boolean;
begin
  Nothing:=true;
  writeln('Результат:');
  for i:=224 to 255 do
  begin
    ch:=chr(i);

    if ch in SetAbsence then
    begin
      write(ch,' ');
      Nothing:=false;
    end;
  end;
  if Nothing then
    writeln('В строке есть все согласные буквы');
end;
end.
 