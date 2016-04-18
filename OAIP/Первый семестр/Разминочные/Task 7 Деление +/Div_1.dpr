Program Div_1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  input : string ='0123456789';
  ten=10;
  fifty=50;
Var
  input_dividend,input_divider : string;
  result_str,dividend_str : string;
  i,j,lenth_dividend, lenth_divider : integer;
  current_result_number,copy_count,diff : integer;
  Arr_dividend : array[1..fifty] of integer;
  Arr_divider : array[1..fifty] of integer;
  Arr_temp_devived : array[1..fifty] of integer;
  Arr_temp_last_devived : array[1..fifty] of integer;
  Arr_temp_divider : array[1..fifty] of integer;

  socer : integer;
  Arr_temp : array[1..fifty] of integer;
  Arr_result : array[1..fifty] of integer;
  number_is_negative  : boolean;
Begin
  repeat
    writeln('Enter dividend ');
    readln(input_dividend);
    socer:=0;
    for i:=1 to (length(input_dividend)) do
      for j:=1 to (length(input)) do
        if (chr(ord(input[j])))=(input_dividend[i]) then
          socer:=socer+1;
      if socer<>(length(input_dividend)) then
          writeln('Error retype');
  until (socer=(length(input_dividend)));


  for i:=1 to (length(input_dividend)) do
    Arr_dividend[i]:=strtoint(input_dividend[i]);

  repeat
    writeln('Enter divider ');
    readln(input_divider);
    socer:=0;
    for i:=1 to (length(input_divider)) do
      for j:=1 to (length(input)) do
        if (chr(ord(input[j])))=(input_divider[i]) then
          socer:=socer+1;
      if socer<>(length(input_divider)) then
        writeln('Error retype');
  until (socer=(length(input_divider)));

  for i:=1 to (length(input_divider)) do
    Arr_divider[i]:=strtoint(input_divider[i]);


   lenth_dividend :=length(input_dividend);
   lenth_divider := length(input_divider);

   //�������� ���������� ��������, ������� ����� ��������
   copy_count:=lenth_divider;

   while copy_count <= lenth_dividend do
   begin

    current_result_number:=0; //������ ��������� ������� �������� �������
    for i:=1 to copy_count do //�������� ����� �� �������� (��� ���������� ������ �� 1 ������ ������ ��������)
    begin
      Arr_temp_devived[i]:= Arr_dividend[i];
      //�������� �� ����������� ����� ��� ���� ����� ��������� ���� �� �����
      if (copy_count - i >= lenth_divider) then
        Arr_temp_divider[i]:=0
      else
        Arr_temp_divider[i]:= Arr_divider[i - copy_count + lenth_divider]
    end;

    if copy_count < lenth_divider then
      number_is_negative:=true
    else
      number_is_negative:=false;

    //�������� ������� ������� �������� ����� ��������
    while number_is_negative=false do
    begin
      i:=copy_count;

      while (i>= 1) and (number_is_negative=false) do
      begin
        diff:= Arr_temp_devived[i] - Arr_temp_divider[i];
        if (diff < 0) then
        begin
          j:=i-1;

          while (Arr_temp_devived[j] = 0) and (j >= 1) do
          begin
            Arr_temp_devived[j]:=9;
            j:= j-1;
          end;

          if( j < 1) then
            number_is_negative:= true
          else
          begin
            Arr_temp_devived[j]:=Arr_temp_devived[j] - 1;
            diff:= diff + 10;
          end;

        end;

        Arr_temp[i]:= diff;
        i:=i-1;
      end;

      if (number_is_negative=false) then //��������� ��� ����� �� ������������� � ���� ��� ��� �������� ���������
      begin
        for i:=1 to 50 do //������� � ������� ��������� ��������, � ����� �������� ��� �� ������ ���� ��� ���� ��������� ������������� ����� � ���� ��������
        begin
          Arr_temp_devived[i]:=Arr_temp[i];
          Arr_temp_last_devived[i]:=Arr_temp[i];
        end;

        current_result_number:=current_result_number+1;
      end
      else
      begin
        if(current_result_number>0) then //���������� ������� � �������, ��� ����������������� � �����, ������ ���� ������� ����������
        begin
          for i:=1 to copy_count do
          begin
            Arr_dividend[i]:=Arr_temp_last_devived[i];
          end;
        end;
      end;

    end;
    Arr_result[copy_count]:=current_result_number; //���������� � ������ ����������� ������� �������
    copy_count:=copy_count+1;
  end;


  for i:=1 to copy_count-1 do
    result_str:=result_str+inttostr(Arr_result[i]);

  while (ord(result_str[1])=48) and(length(result_str)<>1) do
    delete(result_str,1,1);

  writeln('The integer part = ', result_str);

  for i:=1 to copy_count-1 do
    dividend_str:=dividend_str+inttostr(Arr_dividend[i]);

  while (ord(dividend_str[1])=48) and(length(dividend_str)<>1) do
    delete(dividend_str,1,1);
  writeln('The residue = ',dividend_str);
  readln;
end.




























