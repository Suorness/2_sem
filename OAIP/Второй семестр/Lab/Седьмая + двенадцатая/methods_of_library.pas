unit methods_of_library;

interface
Type
  TypeInt = function(x:real):real;
  TypeCalc = function (Part:integer;LengthOfPart:real;x:real;integral:TypeInt):real;

  Function trapeze (Part:integer;LengthOfPart:real;x:real;integral:TypeInt):real;
  function RightRectangles(Part:integer;LengthOfPart:real;x:real;integral:TypeInt):real;
implementation

Function trapeze (Part:integer;LengthOfPart:real;x:real;integral:TypeInt):real;
Var
  i:integer;
begin
  Result:=integral(x)/2;
  for i:=1 to part-1 do
  begin
    x:=x+LengthOfPart;
    Result:=Result+integral(x);
  end;

end;

function RightRectangles(Part:integer;LengthOfPart:real;x:real;integral:TypeInt):real;
Var
  i:integer;
begin
  Result:=0;
  for i:=1 to Part do
  begin
    Result:=Result+integral(x);
    x:=x+LengthOfPart;
  end;
end;
end.
