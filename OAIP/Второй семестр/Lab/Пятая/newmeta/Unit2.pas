unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Spin;
Type
  TAirplain=record
    //��� ��������
    TypeAirPlain:string[50];
    //��� �������
    Year:integer;
    //������ �������� �� 1000 ��
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
    SEYear: TSpinEdit;
    SEOil: TSpinEdit;
    procedure BAddElClick(Sender: TObject);
    procedure BLoadListClick(Sender: TObject);
    procedure BdeleteClick(Sender: TObject);
    procedure BchangeClick(Sender: TObject);
    procedure BSaveChangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure addToFileListPlain(roadPlainList:string);
    procedure LoadingDataInListPlain(roadPlainList:string);
    procedure DeleteDataInList(roadPlainList:string);
    procedure PrintDataInEdit(var ChangeIndex:integer);
    procedure SaveChanges(ChangeIndex:integer;roadPlainList:string);
  end;

var
  ChangeIndex:integer;
  roadPlainList:string;
  roadTimeTable:string;
  FListPlain: TFListPlain;
implementation

{$R *.dfm}
procedure TFListPlain.addToFileListPlain(roadPlainList:string);
Var
  FileForSave:File of TAirplain;
  AddData:Tairplain;
  ListItem:TlistItem;
begin
  if  (Eaddtype.Text<>'') and (SEYear.value<>0) and (SEOil.value<>0) then
  begin
    {���������� ���������� ������}
    AddData.TypeAirPlain:=Eaddtype.Text;
    addData.Year:=SEYear.Value;
    addData.oil:=SEOil.Value;
    Eaddtype.Text:='';
    SEYear.value:=0;
    SEOil.Value:=0;

    assignfile(FileForSave,roadPlainList);
    reset(fileForSave);
    seek(fileForSave,FileSize(FileForSave));
    write(FileForSave,AddData);
    closeFile(FileForSave);

    {���������� � �������}
    ListPlain.Items.BeginUpdate;
    listItem:=ListPlain.Items.add;
    ListItem.Caption:=addData.TypeAirPlain;
    ListItem.SubItems.add(inttostr(addData.Year));
    ListItem.SubItems.add(inttostr(addData.oil));
    ListPlain.Items.EndUpdate;
  end
  else
    showmessage('Missing data');
end;


procedure TFlistPlain.LoadingDataInListPlain(roadPlainList:string);
Var
 FileForLoad:File of TAirplain;
 AddData:Tairplain;
 ListItem:TlistItem;
begin
  listPlain.Clear;
  assignfile(FileForLoad,roadPlainList);
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
  closefile(FileForLoad);
end;
procedure TFListPlain.BAddElClick(Sender: TObject);
begin
  addToFileListPlain(roadPlainList);
end;

procedure TFListPlain.BLoadListClick(Sender: TObject);
begin

  LoadingDataInListPlain(roadPlainList);
end;

procedure TFListPlain.DeleteDataInList(roadPlainList:string);
Var
 FileForUpDate:File of TAirplain;
 AddData:Tairplain;
 i:integer;
begin
  ListPlain.DeleteSelected;
  assignfile(FileForUpDate,roadPlainList);
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

procedure TFListPlain.PrintDataInEdit(var ChangeIndex:integer );

begin
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
  end
  else
    showmessage('�������� ����� ���');

end;

procedure TFListPlain.SaveChanges(ChangeIndex:integer;roadPlainList:string);
Var
 FileForUpDate:File of TAirplain;
 AddData:Tairplain;
 i:integer;
begin
  ListPlain.items[changeindex].Caption:= EAddType.Text;
  ListPlain.Items[changeindex].SubItems.Strings[0]:= inttostr(SEYear.value);
  ListPlain.Items[changeindex].SubItems.Strings[1]:= inttostr(SEOil.value);
  assignfile(FileForUpDate,roadPlainList);
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
  DeleteDataInList(roadPlainList);
end;

procedure TFListPlain.BchangeClick(Sender: TObject);
begin
  PrintDataInEdit(changeindex);
end;

procedure TFListPlain.BSaveChangeClick(Sender: TObject);
begin
  SaveChanges(ChangeIndex,roadPlainList);
end;

procedure TFListPlain.FormCreate(Sender: TObject);
begin
  bSaveChange.Enabled:=false;
  roadPlainList:='PlainList.dat';
  roadTimeTable:='TimeTable.dat';
end;

end.

