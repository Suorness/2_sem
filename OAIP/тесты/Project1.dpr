program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i:integer;
  test:boolean;
  str:string;

procedure srav(str:string;i:integer;var test:boolean);

begin
  if ord(str[i])=ord(str[(length(str)-i+1)]) then
  begin
    if i<>(((length(str)) div 2)+1) then
      srav(str,i+1,test);
  end
  else
    test:=false;
end;
begin
  i:=1;
  readln(str);
  test:=true;
  srav(str,i,test);
  if test then
    writeln('Zerk')
  else
    writeln('not');
  readln;
end.
