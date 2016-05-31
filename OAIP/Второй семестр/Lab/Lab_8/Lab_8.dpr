Program Lab_8;

{$APPTYPE CONSOLE}
Uses
  SysUtils,windows;

Const
  Consonant=['б','в','г','д','ж','з','л','м','н','р','к','п','с','т','ф','х','ц','ч','ш','щ'];

Type
  TSET = set of char;

Var
 str:string;
 SetAbsence:TSet;

{$I C:\Users\Mike\Desktop\Labs\2_sem\Lab_8\data_output.pas }

procedure Line_Inspection(Line:string; Var SetAbsence:TSet);
Var
 SetAvailability:TSet;
 i:integer;
begin
  SetAvailability:=[];
  Line:=AnsiLowerCase(Line);
  for i:=1 to length(Line) do
  begin
    if Line[i] in Consonant then
    begin
      SetAvailability:=SetAvailability+[upcase(Line[i])];
    end;
  end;

  SetAbsence:=Consonant-SetAvailability;
end;

{procedure writeResult(SetAbSence:TSet);
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
end;    }

Begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  writeln('Введите строку для проверки');
  readln(str);

  Line_Inspection(str,SetAbSence);
  writeResult(SetAbSence);
  
  readln;
End.
