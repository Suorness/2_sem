program SORTING;

{$APPTYPE CONSOLE}
uses
  SysUtils;

var
a:array[1..5] of integer;
i,j,k,b:integer;
test:boolean;
begin
  for i:=1 to 5 do
  begin
    writeln('Enter the number of array numbered ', i);
    readln(a[i]);
  end;
  for j:=1 to 4 do
    for i:=1 to 5-j do
      if a[i]>a[i+1] then
        begin
          a[i+1]:=a[i+1]+a[i];
          a[i]:=a[i+1]-a[i];
          a[i+1]:=a[i+1]-a[i];
        end;
  k:=1;
  b:=1;
  i:=1;
  test:=true;
  while i<=5 do
  begin
    if test then
    begin
      if a[i]=a[i+1] then
      k:=k+1
      else
      if k>=2 then test:=false
    end
    else
    if a[i]=a[i+1] then b:=b+1;

    i:=i+1;
  end;

  writeln(k);
  writeln(b);

  readln;

end.
  {for i:=1 to 5 do
  begin
    writeln('The number of array  ', a[i]);
 end;}
