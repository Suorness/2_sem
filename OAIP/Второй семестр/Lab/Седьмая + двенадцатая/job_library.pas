unit job_library;

interface
  Function Int_21_1(x:real):real;
  Function Int_21_3(x:real):real;
implementation

Function Int_21_1(x:real):real;
begin
  result:=((sqrt(1.3*x*x+0.8))/(1.7*x+sqrt(2*x+0.5)));
end;

Function Int_21_3(x:real):real;
begin
  result:=1/(sqrt(2*x*x+0.3))
end;

end.
