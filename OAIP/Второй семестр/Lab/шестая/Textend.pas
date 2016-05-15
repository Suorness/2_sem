program Textend;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  MassValue:array[1..10] of real =
  (7.854e-12,5.954e-11,1.854e-10,9.854e-10,8.844e-19,1.854e-20,1.854e-14,3.854e-15,8.854e-16,1);

Var
  FFileName:textfile;
  MaxNum:real;
  IndexMaxNum:integer;
  i:integer;

procedure addToFile(Var ChangeFile:textfile;addValue:real);
begin
  append(ChangeFile);
  write(ChangeFile,addValue);
end;

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
  rewrite(FFileName);
  for i:=1 to 10 do
    addToFile(FFileName,massValue[i]);
  searchMax(FFileName,MaxNum,IndexMaxNum);
  writeln('Max number = ',MaxNum);
  writeln('Index Max number = ',IndexMaxNum);
  readln;
end.
