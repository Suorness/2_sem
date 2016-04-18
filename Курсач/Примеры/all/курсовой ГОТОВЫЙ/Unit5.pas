unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.Button2Click(Sender: TObject);
begin //кнопка отмена
Form5.Close;
Form1.show;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
a: string; j,i: integer;
begin //кнопка поиск по жанру
with Form1 do
a:=combobox1.Text;
For j:=1 to col   do //обнуляем StringGrid
begin
Form1.StringGrid1.Cells[0,j]:='';
Form1.StringGrid1.Cells[1,j]:='';
Form1.StringGrid1.Cells[2,j]:='';
Form1.StringGrid1.Cells[3,j]:='';
Form1.StringGrid1.Cells[4,j]:='';
Form1.StringGrid1.Cells[5,j]:='';
Form1.StringGrid1.Cells[6,j]:='';
Form1.StringGrid1.Cells[7,j]:='';
end;
Form1.StringGrid1.RowCount:=2;
i:=1;
For j:=1 to col do
begin
if Arrfilm[j].Genre=a then //найденные записи добавляем в StringGrid
begin
Form1.StringGrid1.Cells[0,i]:=arrfilm[j].Filmname;
Form1.StringGrid1.Cells[1,i]:=arrfilm[j].Director;
Form1.StringGrid1.cells[2,i]:=arrfilm[j].Mainrole1;
Form1.StringGrid1.Cells[3,i]:=arrfilm[j].Mainrole2;
Form1.StringGrid1.Cells[4,i]:=inttostr(arrfilm[j].Lasting);
Form1.StringGrid1.Cells[5,i]:=inttostr(arrfilm[j].Year);
Form1.StringGrid1.Cells[6,i]:=arrfilm[j].Genre;
Form1.StringGrid1.Cells[7,i]:=arrfilm[j].Format;
i:=i+1;
Form1.StringGrid1.rowCount:=Form1.StringGrid1.rowCount+1;
end;
end;
if Form1.StringGrid1.RowCount>2 then
begin
Form1.StringGrid1.rowCount:=Form1.StringGrid1.rowCount-1;
end;
Form5.Hide;
Form1.Show;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Form5.Hide;
Form1.Show;
end;

end.
