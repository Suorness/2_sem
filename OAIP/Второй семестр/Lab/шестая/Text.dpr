program Text11;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  MassValue:array[1..10] of real =
  (6.854e-12,5.854e-11,3.854e-10,2.854e-1,8.854e-19,21.854e-20,61.854e-14,8.854e-15,8.854e-16,1);

Var
  TestFile:textfile;
  MaxNum:real;
  IndexMaxNum:integer;
  i,Index:integer;

procedure addToFile(Var ChangeFile:textfile;addValue:real);
begin
  append(ChangeFile);
  write(ChangeFile,addValue);
end;
procedure searchMax(var FileForSearch:textfile;
                    var MaxRealInText:real; var IndexMaxReal:integer);
Var
  TempValue:Real;
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
  assignfile(TestFile,'1.txt');
  rewrite(TestFile);
  for i:=1 to 10 do
    addToFile(TestFile,massValue[i]);
  searchMax(TestFile,MaxNum,IndexMaxNum);
  writeln('Max number = ',MaxNum);
  writeln('Index Max number = ',IndexMaxNum);
  readln;
end.
