program TextendVar2;

{$APPTYPE CONSOLE}

uses
  SysUtils;


Var
  FFileName:textfile;
  MaxNum:real;
  IndexMaxNum:integer;
  i:integer;

procedure searchMax(var FileForSearch:textfile;
                    var MaxRealInText:real; var IndexMaxReal:integer);
Var
  TempValue:Real;
  Index:integer;
begin
  reset(FileForSearch);
  read(FileForSearch,MaxRealIntext);
  IndexMaxReal:=1;
  index:=1;
  while not eof(FileForSearch) do
  begin
    inc(index);
    read(FileForSearch,TempValue);
    if  TempValue>MaxRealInText then
    begin
      MaxRealInText:=TempValue;
      IndexMaxReal:=Index;
    end;
  end;
end;

begin
  assignfile(FFileName,'1.txt');
  reset(FFileName);
  searchMax(FFileName,MaxNum,IndexMaxNum);
  writeln('Max number = ',MaxNum);
  writeln('Index Max number = ',IndexMaxNum);
  readln;
end.
