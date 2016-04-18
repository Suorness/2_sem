Program Lab1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Type
  TArray = array[1..3,1..3] of integer;

Const
  A:TArray = ((1,2,3),(0,-2,3),(1,1,1));
  B:TArray = ((4,2,1),(-1,2,0),(2,3,-1));

Var
  MatA,MatB,MatFirstD,MatSecondD:TArray;
  i,j:integer;

{�������� �������� ���� ������ �������� 3 �� 3}
procedure add (Var MatA,MatB:TArray);
Var
  i,j:integer;
begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      MatA[i,j]:=MatA[i,j]+MatB[i,j];
end;

{�������� �������� ���� ������ �������� 3 �� 3}
procedure sub (Var MatA,MatB:TArray);
Var
  i,j:integer;
begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      MatA[i,j]:=MatA[i,j]-MatB[i,j];
end;

{�������� ��������� ������� �� �����}
procedure multiplyNumb (Var MatA:TArray;num:integer);
Var
  i,j:integer;
begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      MatA[i,j]:=MatA[i,j]*num;
end;

{�������� ������������ ���� ������ �������� 3 �� 3}
procedure multiplyMat (Var MatA,MatB:TArray);
Var
  i,j,k:integer;
  MatC:TArray;
begin
  for i:=1 to 3 do
  begin
    for k:=1 to 3 do
    begin
      MatC[i,k]:=0;
      for j:=1 to 3 do
        MatC[i,k]:=MatC[i,k]+MatA[i,j]*MatB[j,k];
    end;
  end;
  MatA:=MatC;
end;

{����� ������� �� �����}
procedure printAnswer(MatA:TArray);
Var
  i,j:integer;
begin
  writeln('���������:');
  for i:=1 to 3 do
  begin
    for j:=1 to 3 do
      write(MatA[i,j]:2,' ');
    writeln;
  end;

end;



Begin
  {���������� ����}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  {�������������� ��������� �������� }
  MatA:=A;
  MatB:=B;
  {��������� �������������� ��������}
  add(MatA,MatB);
  multiplyNumb(MatA,3);
  MatFirstD:=MatA;
  MatA:=A;
  MatB:=B;
  sub(MatA,MatB);
  MatSecondD:=MatA;
  MatA:=A;
  multiplyMat(MatSecondD,MatA);
  sub(MatFirstD,MatSecondD);
  {������� ���������}
  printAnswer(MatFirstD);
  readln;
End.
