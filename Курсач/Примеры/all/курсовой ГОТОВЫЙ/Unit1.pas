unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus;

type
  Tfilm = record
   Filmname: String[20];
   Director: String[20];
   Mainrole1: string[20];
   Mainrole2: string[20];
   Year: integer;
   Lasting:integer;
   Genre: string[20];
   Format:string[10];
   ccount:integer;
   rcount:integer;
   value:string[255];
   end;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    FindDialog1: TFindDialog;
    N16: TMenuItem;
    N17: TMenuItem;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    procedure N17Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N14Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  Film: Tfilm;
  ArrFilm:array[1..80] of Tfilm;//������ ��� �������
  Arrdata:array[1..80] of integer;// ������ ��� ������
  Col:byte;  //����������� �������

implementation

uses Unit3, Unit4, Unit2, Unit5, Unit6;

{$R *.dfm}

procedure TForm1.N17Click(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
Form4.showModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//������������ ���������� �������.
Stringgrid1.Cells[0,0]:='��������';
Stringgrid1.Cells[1,0]:='��������';
Stringgrid1.Cells[2,0]:='� ������� ���� �1';
Stringgrid1.Cells[3,0]:='� ������� ���� �2';
Stringgrid1.Cells[4,0]:='��� �������';
Stringgrid1.Cells[5,0]:='�����������������';
Stringgrid1.Cells[6,0]:='����';
Stringgrid1.Cells[7,0]:='��� ��������';

end;

procedure TForm1.N8Click(Sender: TObject);
//��������� � ����� �2 ��� ����� ������.
begin
Form2.Button1.Caption:='��������';
Form2.Caption:='���������� ������';
Form2.Show;
Form1.Hide;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
if MessageDlg('��� ������������� ������ ����� ��������, ������ ����������?',
  mtCustom, [mbOk, mbCancel],0)=mrOk
  then
Application.Terminate; //�������� ����������.
end;

procedure TForm1.N2Click(Sender: TObject);//�������� �����
var
i,j,n,m,kk:integer;
F:File of TFilm;
Str:TFilm;
begin
if opendialog1.Execute then
try
kk:=0;
AssignFile(F,opendialog1.FileName);
Reset(F);
Seek(F,0);
Read(F,Str);
n:=Str.rcount;
m:=Str.ccount;
StringGrid1.RowCount:=n;
StringGrid1.ColCount:=m;
for i:=0 to n-1 do
begin
for j:=0 to m-1 do
begin
Seek(F,kk);
Read(F,Str);
StringGrid1.Cells[j,i]:=Str.value;
inc(kk);
end;
end;
CloseFile(F);
Form1.Label1.Visible:=true;
Form1.N6.Enabled:=true;
Form1.N9.Enabled:=true;
Form1.N11.Enabled:=true;
Form1.StringGrid1.Visible:=true;
// ���������� ������� �� StringGrid1 � ������.
Col:=StringGrid1.RowCount-1;
for j:=1 to col do
begin
  arrfilm[j].Filmname:=StringGrid1.Cells[0,j];
  arrfilm[j].Director:=StringGrid1.Cells[1,j];
  arrfilm[j].Mainrole1:=StringGrid1.Cells[2,j];
  arrfilm[j].Mainrole2:=StringGrid1.Cells[3,j];
  arrfilm[j].Year:=strtoint(StringGrid1.Cells[4,j]);
  arrfilm[j].Lasting:=strtoint(StringGrid1.Cells[5,j]);
  arrfilm[j].Genre:=StringGrid1.Cells[6,j];
  arrfilm[j].Format:=StringGrid1.Cells[7,j];
end;
except
on e:Exception do
end;
end;



procedure TForm1.N9Click(Sender: TObject);//��������������
var nomber: integer;
begin
//���������� ������ ���������� ������
//�������� ������ �� StringGrid �� Form2
nomber:=StringGrid1.Row;
Form2.Caption:='��������������';
Form2.Button1.Caption:='��������������';
Form1.Hide;
Form2.Show;

with Form2 do
begin
Edit1.Text:=stringGrid1.Cells[0,nomber];
Edit2.Text:=StringGrid1.Cells[1,nomber];
Edit3.Text:=StringGrid1.Cells[2,nomber];
Edit4.Text:=StringGrid1.Cells[3,nomber];
Edit5.Text:=StringGrid1.Cells[5,nomber];
Combobox1.Text:=StringGrid1.Cells[4,nomber];
Combobox2.Text:=StringGrid1.Cells[6,nomber];
Combobox3.Text:=StringGrid1.Cells[7,nomber];
end;
end;

procedure TForm1.N11Click(Sender: TObject);//�������� ������
var
nomber,i,j : integer;
begin
nomber:=StringGrid1.Row;
if messageDlg('������� �����  '+ StringGrid1.Cells[0,nomber], MtCustom,
 [mbYes, mbNo],0)=MrYes then
  begin
  //����� ������������ ��������, ������� ��� �������� :)
  for i:=nomber to Col do
  Arrfilm[i]:=Arrfilm[i+1];
  if col<>1 then
  StringGrid1.RowCount:=Col;
  StringGrid1.Cells[0,1]:='';
  StringGrid1.Cells[1,1]:='';
  StringGrid1.Cells[2,1]:='';
  StringGrid1.Cells[3,1]:='';
  StringGrid1.Cells[4,1]:='';
  StringGrid1.Cells[5,1]:='';
  StringGrid1.Cells[6,1]:='';
  StringGrid1.Cells[7,1]:='';
  col:=col-1;

  for j:=1 to Col do
  begin
  StringGrid1.Cells[0,j]:=arrfilm[j].Filmname;
  StringGrid1.Cells[1,j]:=arrfilm[j].Director;
  StringGrid1.Cells[2,j]:=arrfilm[j].Mainrole1;
  StringGrid1.Cells[3,j]:=arrfilm[j].Mainrole2;
  StringGrid1.Cells[4,j]:=inttostr(arrfilm[j].Year);
  StringGrid1.Cells[5,j]:=inttostr(arrfilm[j].Lasting);
  StringGrid1.Cells[6,j]:=arrfilm[j].Genre;
  StringGrid1.Cells[7,j]:=arrfilm[j].Format;
  end;
  ShowMessage('������ ������� �������');
end;
end;
procedure TForm1.N3Click(Sender: TObject);//���������� � ����
var
F:File of TFilm;
i,j:integer;
Str:TFilm;
begin
if StringGrid1.Cells[0,1]='' then
begin
showmessage('��� ������� ��� ���������!');
exit;
end;
if savedialog1.Execute then
try
AssignFile(F, savedialog1.FileName);
Rewrite(F);
Str.ccount:=StringGrid1.ColCount;
Str.rcount:=StringGrid1.RowCount;
for i:=0 to StringGrid1.RowCount-1 do
begin
for j:=0 to StringGrid1.ColCount-1 do
begin
Str.value:=StringGrid1.Cells[j,i];
Write(F,Str);
end;
end;
CloseFile(F);
except
on e:Exception do
end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin  //�������� ���������� �������� �� ������� � ������ ������� ����
if MessageDlg('��� ������������� ������ ����� ��������, ������ ����������?',
  mtCustom, [mbOk, mbCancel],0)=mrOk
  then
Application.Terminate;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
Form1.Hide;
Form5.Show;
end;

procedure TForm1.N18Click(Sender: TObject);
var i,j,sum,max,a: integer; // ����� ������ ����������� ���������:)
begin
if Form1.StringGrid1.cells[0,1]='' then
begin
Showmessage('��� �������');
exit;
end;
For i:=1 to col do
begin
For j:=1 to col do
if arrfilm[i].Director=arrfilm[j].Director then
begin
sum:=sum+1;
end;
arrdata[i]:=sum;
end;
max:=1;
for i:=1 to col do
if arrdata[i]> max then
begin
max:=arrdata[i];
a:=i;
end;
showmessage('����� ���������� ��������'+#13+arrfilm[a].Director);
end;

procedure TForm1.N20Click(Sender: TObject);
var j:integer;
begin  //������ ����������� ������, ������� �������� ������
stringGrid1.RowCount:=col+1;
for j:=1 to Col do
  begin
  StringGrid1.Cells[0,j]:=arrfilm[j].Filmname;
  StringGrid1.Cells[1,j]:=arrfilm[j].Director;
  StringGrid1.Cells[2,j]:=arrfilm[j].Mainrole1;
  StringGrid1.Cells[3,j]:=arrfilm[j].Mainrole2;
  StringGrid1.Cells[4,j]:=inttostr(arrfilm[j].Year);
  StringGrid1.Cells[5,j]:=inttostr(arrfilm[j].Lasting);
  StringGrid1.Cells[6,j]:=arrfilm[j].Genre;
  StringGrid1.Cells[7,j]:=arrfilm[j].Format;
  end;
end;

procedure TForm1.N19Click(Sender: TObject);
var j,s:integer;
begin
s:=0;
for j:=1 to col do
begin
if Arrfilm[j].Year=2011 then
s:=s+1;
end;
Showmessage('������� ��������� ���� � ����:'+#13+inttostr(s));
end;

procedure TForm1.N15Click(Sender: TObject);
begin
Form1.Hide;
Form6.show;
end;

end.


