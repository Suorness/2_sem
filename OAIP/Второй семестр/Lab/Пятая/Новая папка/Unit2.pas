unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Spin;
Type
  TAirplain=record
    //Тип самолета
    TypeAirPlain:string[50];
    //Год выпуска
    Year:integer;
    //расход горючего на 1000 км
    oil:integer;

  end;
type
  TFListPlain = class(TForm)
    PanelListPlain: TPanel;
    ListPlain: TListView;
    BAddEl: TButton;
    TypePlain: TLabel;
    LJustWord: TLabel;
    EAddType: TEdit;
    LYear: TLabel;
    Loil: TLabel;
    BLoadList: TButton;
    Bdelete: TButton;
    Bchange: TButton;
    BSaveChange: TButton;
    Button1: TButton;
    SEYear: TSpinEdit;
    SEOil: TSpinEdit;
    procedure BAddElClick(Sender: TObject);
    procedure BLoadListClick(Sender: TObject);
    procedure BdeleteClick(Sender: TObject);
    procedure BchangeClick(Sender: TObject);
    procedure BSaveChangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure addToFileListPlain(Sender:TObject);
    procedure LoadingDataInListPlain(sender:TObject);
    procedure DeleteDataInList(sender:TObject);
    procedure PrintDataInEdit(sender:TObject;var ChangeIndex:integer);
    procedure SaveChanges(sender:TObject;ChangeIndex:integer);
  end;

var
  ChangeIndex:integer;
  FListPlain: TFListPlain;
implementation

{$R *.dfm}
procedure TFListPlain.addToFileListPlain(Sender:TObject);
Var
  FileForSave:File of TAirplain;
  AddData:Tairplain;
  ListItem:TlistItem;
begin
  if  (Eaddtype.Text<>'') and (SEYear.value<>0) and (SEOil.value<>0) then
  begin
    {Сохранение полученных данных}
    AddData.TypeAirPlain:=Eaddtype.Text;
    addData.Year:=SEYear.Value;
    addData.oil:=SEOil.Value;
    Eaddtype.Text:='';
    SEYear.value:=0;
    SEOil.Value:=0;

    assignfile(FileForSave,'PlainList.dat');
    reset(fileForSave);
    seek(fileForSave,FileSize(FileForSave));
    write(FileForSave,AddData);
    closeFile(FileForSave);

    {Добавление в таблицу}
    ListPlain.Items.BeginUpdate;
    listItem:=ListPlain.Items.add;
    ListItem.Caption:=addData.TypeAirPlain;
    ListItem.SubItems.add(inttostr(addData.Year));
    ListItem.SubItems.add(inttostr(addData.oil));
    ListPlain.Items.EndUpdate;
  end
  else
    showmessage('Error');
end;


procedure TFlistPlain.LoadingDataInListPlain(Sender:TObject);
Var
 FileForLoad:File of TAirplain;
 AddData:Tairplain;
 ListItem:TlistItem;
begin
  listPlain.Clear;
  assignfile(FileForLoad,'PlainList.dat');
  reset(FileForLoad);
  while not eof(FileForLoad) do
  begin
    read(FileForLoad,addData);
    ListPlain.Items.BeginUpdate;
    listItem:=ListPlain.Items.add;
    ListItem.Caption:=addData.TypeAirPlain;
    ListItem.SubItems.add(inttostr(addData.Year));
    ListItem.SubItems.add(inttostr(addData.oil));
    ListPlain.Items.EndUpdate;
  end;
  //showmessage('End File');
  closefile(FileForLoad);
end;
procedure TFListPlain.BAddElClick(Sender: TObject);
begin
  addToFileListPlain(FListPlain);
end;

procedure TFListPlain.BLoadListClick(Sender: TObject);
begin

  LoadingDataInListPlain(FListPlain);
end;

procedure TFListPlain.DeleteDataInList(Sender:TObject);
Var
 FileForUpDate:File of TAirplain;
 AddData:Tairplain;
 //ListItem:TlistItem;
 i:integer;
begin
  ListPlain.DeleteSelected;
  assignfile(FileForUpDate,'PlainList.dat');
  rewrite(FileForUpDate);
  for i:=0 to ListPlain.Items.Count-1 do
  begin
    AddData.TypeAirPlain:=ListPlain.Items[i].Caption;
    AddData.Year:=strtoint(ListPlain.Items[i].SubItems.Strings[0]);
    AddData.oil:=strtoint(ListPlain.Items[i].SubItems.Strings[1]);
    write(FileForUpDate,AddData);
  end;
  closeFile(FileForUpDate);
end;

procedure TFListPlain.PrintDataInEdit(sender:TObject;var ChangeIndex:integer );

begin
  {Блокирую остальные клавиши
    и можешь Переименовать это же в сохранение изменений}
  if ListPlain.SelCount = 1 then
  begin
    Bdelete.Enabled:=false;
    BAddEl.Enabled:=false;
    BLoadList.Enabled:=false;
    bCHAnge.Enabled:=false;
    Changeindex:=ListPlain.ItemFocused.Index;
    EAddType.Text:=ListPlain.items[changeindex].Caption;
    SEYear.value:=strtoint(ListPlain.Items[changeindex].SubItems.Strings[0]);
    SEOil.value:=strtoint(ListPlain.Items[changeindex].SubItems.Strings[1]);
    bSaveChange.Enabled:=true;
    {Разблокировать кнопку "сохранить изменения"}
  end
  else
    showmessage('Выделите однин тип');

end;

procedure TFListPlain.SaveChanges(Sender:TObject;ChangeIndex:integer);
Var
 FileForUpDate:File of TAirplain;
 AddData:Tairplain;
 i:integer;
begin
  ListPlain.items[changeindex].Caption:= EAddType.Text;
  ListPlain.Items[changeindex].SubItems.Strings[0]:= inttostr(SEYear.value);
  ListPlain.Items[changeindex].SubItems.Strings[1]:= inttostr(SEOil.value);
  assignfile(FileForUpDate,'PlainList.dat');
  rewrite(FileForUpDate);
  for i:=0 to ListPlain.Items.Count-1 do
  begin
    AddData.TypeAirPlain:=ListPlain.Items[i].Caption;
    AddData.Year:=strtoint(ListPlain.Items[i].SubItems.Strings[0]);
    AddData.oil:=strtoint(ListPlain.Items[i].SubItems.Strings[1]);
    write(FileForUpDate,AddData);
  end;
  closeFile(FileForUpDate);
  Bdelete.Enabled:=true;
  BAddEl.Enabled:=true;
  BLoadList.Enabled:=true;
  BSaveChange.Enabled:=false;
  bCHAnge.Enabled:=true;
  Eaddtype.Text:='';
  SEYear.value:=0;
  SEOil.value:=0;
end;

procedure TFListPlain.BdeleteClick(Sender: TObject);
begin
  DeleteDataInList(FListPlain);
end;

procedure TFListPlain.BchangeClick(Sender: TObject);
begin
  PrintDataInEdit(FListPlain,changeindex);
end;

procedure TFListPlain.BSaveChangeClick(Sender: TObject);
begin
  SaveChanges(FListPlain,ChangeIndex);
end;

procedure TFListPlain.FormCreate(Sender: TObject);
begin
  bSaveChange.Enabled:=false;
end;

procedure TFListPlain.Button1Click(Sender: TObject);
begin
  if  ListPlain.SelCount>=1 then
    showmessage(inttostr(ListPlain.ItemFocused.Index));
   //ListPlain.ItemFocused.Selected<>false
end;

end.
{Последний end не потеряй!}

{//ListPlain.Items[0].SubItems.Strings[1]
//ListPlain.Items[0].Items[0].Caption
//ListView1.Items.Count - 1
  //DeleteDataInList(FListPlain);
  //showmessage(inttostr(ListPlain.Items.Count));
  //ListPlain.Items.Count}
