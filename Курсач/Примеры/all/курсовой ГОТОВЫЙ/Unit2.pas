unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

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
   end;

  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);

    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  //Film: Tfilm;
  //ArrFilm:array[1..80] of Tfilm;
  //Col: byte;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var j,a:integer;
begin
if Caption ='Добавление данных'
then
begin
Col:= Col+1;
Form1.StringGrid1.RowCount:=Col+1;
//end;
//Формирование массива
ArrFilm[Col].Filmname:=Edit1.text;
ArrFilm[Col].Director:=Edit2.text;
ArrFilm[Col].Mainrole1:=Edit3.Text;
ArrFilm[Col].Mainrole2:=edit4.Text;
ArrFilm[Col].Year:=strtoint(combobox1.Text);
ArrFilm[Col].Lasting:=strtoint(Edit5.Text);
ArrFilm[Col].Genre:=Combobox2.text;
ArrFilm[Col].Format:=Combobox3.Text;
end;
//Это нужно чтобы отредактировать запись, добавить ее в массив и в StringGrid1
If button1.Caption='Редактирование' then
begin
// Запись в массив отредактированной запись
a:=Form1.StringGrid1.Row;
arrfilm[a].Filmname:=Edit1.Text;
arrfilm[a].Director:=Edit2.Text;
arrfilm[a].Mainrole1:=Edit3.Text;
arrfilm[a].Mainrole2:=Edit4.Text;
arrfilm[a].Lasting:=strtoint(Edit5.Text);
arrfilm[a].Year:=strtoint(Combobox1.Text);
arrfilm[a].Genre:=Combobox2.Text;
arrfilm[a].Format:=Combobox3.Text;
Form2.Hide;
Form1.Show;
for j:=1 to Col do
  begin
  Form1.StringGrid1.Cells[0,j]:=arrfilm[j].Filmname;
  Form1.StringGrid1.Cells[1,j]:=arrfilm[j].Director;
  Form1.StringGrid1.Cells[2,j]:=arrfilm[j].Mainrole1;
  Form1.StringGrid1.Cells[3,j]:=arrfilm[j].Mainrole2;
  Form1.StringGrid1.Cells[4,j]:=inttostr(arrfilm[j].Year);
  form1.StringGrid1.Cells[5,j]:=inttostr(arrfilm[j].Lasting);
  Form1.StringGrid1.Cells[6,j]:=arrfilm[j].Genre;
  Form1.StringGrid1.Cells[7,j]:=arrfilm[j].Format;
  end;
end;
//Проверка заполненны ли все поля для ввода.
If (Edit1.text = '')
   or (Edit2.Text = '')
   or (Edit3.Text ='')
   or (Edit4.Text ='')
   or (Edit5.Text ='')
   or (ComboBox1.Text='')
   or (ComboBox2.Text='')
   or (ComboBox3.Text='')
 then Showmessage('Заполните все поля!')
 else     //Очистка полей ввода Edit и ComboBox.
Showmessage('Данные успешно добавленны.');
Edit1.Text:='';
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Combobox1.Text:='';
Combobox2.Text:='';
Combobox3.Text:='';
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var  j: integer;
begin
//Проверка не пусты ли поля Edit и ComboBox.
If  (Edit1.text <> '')
   or (Edit2.Text <> '')
   or (Edit3.Text <>'')
   or (Edit4.Text <>'')
   or (Edit5.Text <>'')
   or (ComboBox1.Text<>'')
   or (ComboBox2.Text<>'')
   or (ComboBox3.Text<>'')
 then showmessage('Данные не сохранены.');
 if MessageDlg('Вы действительно хотите закрыть это окно?',
  mtCustom, [mbOk, mbCancel],0)=mrOk
  then
  begin
  Canclose:=true;
  If Col > 0 then //если была введена запись сделать видимыми эти пункты меню
  begin
  Form1.Label1.Visible:=true;
  Form1.N6.Enabled:=true;
  Form1.N9.Enabled:=true;
  Form1.N11.Enabled:=true;
  Form1.StringGrid1.Visible:=true;
  end;
// Добавление записей из массива в StringGrid1.
  Form1.Show ;
  for j:=1 to Col do
  begin
  Form1.StringGrid1.Cells[0,j]:=arrfilm[j].Filmname;
  Form1.StringGrid1.Cells[1,j]:=arrfilm[j].Director;
  Form1.StringGrid1.Cells[2,j]:=arrfilm[j].Mainrole1;
  Form1.StringGrid1.Cells[3,j]:=arrfilm[j].Mainrole2;
  Form1.StringGrid1.Cells[4,j]:=inttostr(arrfilm[j].Year);
  form1.StringGrid1.Cells[5,j]:=inttostr(arrfilm[j].Lasting);
  Form1.StringGrid1.Cells[6,j]:=arrfilm[j].Genre;
  Form1.StringGrid1.Cells[7,j]:=arrfilm[j].Format;
  end;
  end
  else Canclose:=false;
end;
//Проверка правильности ввода в поле Режиссер
procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
Case key of
'А'..'Я','а'..'я','.','-':;
    #32,#8:;
    else
      begin
      key:=chr(0);
      ShowMessage('Фамилия режиссера не может содержать ничего кроме букв');
      end;
end;
end;
//Проверка правильности ввода в поле главная роль №1
procedure TForm2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
Case key of
'А'..'Я','а'..'я','.','-':;
    #32,#8:;
    else
      begin
      key:=chr(0);
      ShowMessage('Фамилия не может содержать ничего кроме букв');
      end;
end;
end;
//Проверка правильности ввода в поле главная роль№2
procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
Case key of
'А'..'Я','а'..'я','.','-':;
    #32,#8:;
    else
      begin
      key:=chr(0);
      ShowMessage('Фамилия не может содержать ничего кроме букв');
      end;
end;
end;
//Проверка правильности ввода в поле продолжительности (фильма)
procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
    '0'..'9':;
    #32,#8:;
    else
      begin
      key:=chr(0);
      ShowMessage('Неправильный ввод данных');
      end;
    end;
end;
//Проверка правильности ввода в поле год выпуска
procedure TForm2.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 case key of
    '0'..'9':;
    #32,#8:;
    else
      begin
      key:=chr(0);
      ShowMessage('Неправильный ввод данных');
      end;
    end;
end;
//Проверка правильности ввода в поле Жанр
procedure TForm2.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
Case key of
'А'..'Я','а'..'я','.':;
    #32,#8:;
    else
      begin
      key:=chr(0);
      ShowMessage('Жанр не может содержать ничего кроме букв');
      end;
end;
end;

end.
