unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;
Type
  TAirplain=record
    //��� ��������
    TypeAirPlain:string[50];
    //��� �������
    Year:integer;
    //������ �������� �� 1000 ��
    oil:integer;

  end;

  TTimeTable=record
    //����� �����
    numberFlight:integer;
    //����� ����������
    place:string[50];
    //��������� ������
    range:integer;
    //��� ��������
    aircraft:TAirplain;
    //����� ������
    timeOutPut:TDateTime;
    //����� ��������
    timeComing:TDateTime;
  end;
type
  TFMain = class(TForm)
    ButtomListPlain: TButton;
    ListTable: TListView;
    LabMainText: TLabel;
    LabNumberFlight: TLabel;
    LabPlace: TLabel;
    LabRange: TLabel;
    LabAirCraft: TLabel;
    LabTimeOutPut: TLabel;
    LabComing: TLabel;
    EPlace: TEdit;
    ComboBoxAirPlain: TComboBox;
    TimeOutPut: TDateTimePicker;
    TimeComing: TDateTimePicker;
    BAddDataList: TButton;
    BDowloadData: TButton;
    SENumberFlight: TSpinEdit;
    SERange: TSpinEdit;
    BDel: TButton;
    BChange: TButton;
    BSaveChanges: TButton;
    LabSearchText: TLabel;
    ESearchPlace: TEdit;
    BSearchPlace: TButton;
    ListSearchResult: TListView;
    Label1: TLabel;
    EOilResult: TEdit;
    procedure ButtomListPlainClick(Sender: TObject);
    procedure BTestClick(Sender: TObject);
    procedure ComboBoxAirPlainDropDown(Sender: TObject);
    procedure BAddDataListClick(Sender: TObject);
    procedure BDowloadDataClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure BSaveChangesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BSearchPlaceClick(Sender: TObject);
    procedure ListTableChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
  public
    procedure addToFileListTable(Sender:TObject);
    procedure addToListTable(Sender:TObject);
    procedure DeleteDateInList(Sender:TObject);
    procedure printDate(Sender:TOBject;var ChangeIndex:integer);
    procedure SaveChanges(Sender:TObject;ChangeIndex:integer);
    procedure SearchPlace(Sender:TObject);
    procedure CalculeteOil(Sender:TObject);
  end;

var
  ChangeIndex:integer;
  FMain: TFMain;

implementation

uses Unit2;

{$R *.dfm}

procedure TFMain.ButtomListPlainClick(Sender: TObject);
begin
  flistPlain.show;
end;

procedure TFMain.BTestClick(Sender: TObject);

begin

end;

//end;

procedure TFMain.ComboBoxAirPlainDropDown(Sender: TObject);
Var
 FileForUpDate:File of TAirplain;
 Data:Tairplain;

begin
  ComboBoxAirplain.Clear;
  assignfile(FileForUpDate,'PlainList.dat');
  reset(FileForUpDate);
  while not eof(FileForUpDate) do
  begin
    read(FileForUpDate,Data);
    ComboBoxAirplain.AddItem(Data.TypeAirPlain,ComboBoxAirplain);
  end;
  closefile(FileForUpDate)
end;

procedure TFMain.addToFileListTable(Sender:TObject);
Var
  FileForSave:File of TTimeTable;
  FileInfo:File of TAirPlain;
  AddData:TTimeTable;
  ListItem:TlistItem;
begin
  if (SENumberFlight.value <>0) and(EPlace.text <>'' ) and(SERange.value<>0 )and(ComboBoxAirPlain.text <>'' )  then
  begin
    assignFile(FileInfo,'PlainList.dat');
    reset(FileInfo);

    adddata.numberFlight:=SENumberFlight.value;
    adddata.place:=EPlace.text;
    adddata.range:=SERange.value;
    EPlace.text:='';
    SERange.Value:=0;
    SENumberFlight.value:=0;

    repeat
      read(FileInfo,adddata.aircraft);
    until (ComboBoxAirPlain.text=adddata.aircraft.TypeAirPlain) or eof(FileInfo);
    closeFile(FileInfo);
    adddata.timeOutPut:=timeOutPut.DateTime;
    adddata.timeComing:=timeComing.DateTime;
    assignfile(FileForSave,'TimeTable.dat');
    reset(FileForSave);
    seek(FileForSave,FileSize(FileForSave));
    write(FileForSave,AddData);
    closeFile(FileForSave);
    timeoutPut.DateTime:=time;
    timeComing.DateTime:=time;
    ComboBoxAirPlain.text:='';
    listTable.Items.BeginUpdate;
    listItem:=listTable.Items.add;
    ListItem.Caption:=inttostr(addData.numberFlight);
    ListItem.SubItems.add(addData.place);
    ListItem.SubItems.add(inttostr(addData.range));
    ListItem.SubItems.add(addData.aircraft.TypeAirPlain);
    ListItem.SubItems.add(TimeToStr(AddData.timeOutPut));
    ListItem.SubItems.add(TimeToStr(AddData.timeComing));
    listTable.Items.EndUpdate;

  end
  else
  showmessage('error');
end;
procedure TFMain.addToListTable(Sender:TObject);
Var
 FileForLoad:File of TTimeTable;
 AddData:TTimeTable;
 ListItem:TlistItem;
 //formattedDateTime : string;
begin
  listTable.Clear;
  assignfile(FileForLoad,'TimeTable.dat');
  reset(FileForLoad);
  while not eof(FileForLoad) do
  begin
    read(FileForLoad,addData);
    listTable.Items.BeginUpdate;
    listItem:=listTable.Items.add;
    ListItem.Caption:=inttostr(addData.numberFlight);
    ListItem.SubItems.add(addData.place);
    ListItem.SubItems.add(inttostr(addData.range));
    ListItem.SubItems.add(addData.aircraft.TypeAirPlain);
    ListItem.SubItems.add(TimeToStr(AddData.timeOutPut));
    ListItem.SubItems.add(TimeToStr(AddData.timeComing));
    listTable.Items.EndUpdate;
  end;
  //showmessage('End File');
  closefile(FileForLoad);
end;

procedure TFMain.BAddDataListClick(Sender: TObject);
begin
  addToFileListTable(FMain);
end;

procedure TFMain.BDowloadDataClick(Sender: TObject);
begin
  addToListTable(Fmain);
end;
procedure TFMain.DeleteDateInList(Sender:TObject);
Var
 FileForUpDate:File of TTimeTable;
 AddData:TTimeTable;
 FileInfo:File of TAirPlain;
 i:integer;
begin
  if listTable.SelCount=1 then
  begin
    ListTable.DeleteSelected;
    assignfile(FileForUpDate,'TimeTable.dat');
    rewrite(FileForUpDate);

    assignFile(FileInfo,'PlainList.dat');
    //if ListTAble.Items.Count>0 then
    //begin
      for i:=0 to ListTAble.Items.Count-1 do
      begin
        reset(FileInfo);
        adddata.numberFlight:=strtoint(ListTable.Items[i].Caption);
        adddata.place:=ListTable.Items[i].SubItems.Strings[0];
        adddata.range:=strtoint(ListTable.Items[i].SubItems.Strings[1]);

        repeat
          read(FileInfo,adddata.aircraft);
        until (ListTable.Items[i].SubItems.Strings[2]=adddata.aircraft.TypeAirPlain) or eof(FileInfo);


        adddata.timeOutPut:=strtoTime(ListTable.Items[i].SubItems.Strings[3]);
        adddata.timeComing:=strtoTime(ListTable.Items[i].SubItems.Strings[4]);
        write(FileForUpDate,AddData);
        closeFile(fileInfo);
      end;
    //end;
      closeFile(FileForUpDate);
      CalculeteOil(Fmain);
    end
    else
      showmessage('�������� ����� ���');
end;

procedure TFMain.printDate(Sender:TOBject;var ChangeIndex:integer);
begin
  if ListTable.SelCount=1 then
  begin
    BDel.Enabled:=false;
    BChange.Enabled:=false;
    BSaveChanges.Enabled:=true;
    BDowloadData.Enabled:=false;
    BAddDataList.Enabled:=false;

    Changeindex:=ListTable.ItemFocused.Index;
    SENumberFlight.value:=strtoint(ListTable.items[ChangeIndex].caption);
    EPlace.text:=ListTable.items[changeIndex].SubItems.Strings[0];
    SERange.value:=strtoint(ListTable.items[changeIndex].SubItems.Strings[1]);
    ComboBoxAirPlain.Text:=ListTable.items[changeIndex].SubItems.Strings[2];
    timeOutPut.Time:=strtoTime(ListTable.items[changeIndex].SubItems.Strings[3]);
    timeComing.Time:=strtoTime(ListTable.items[changeIndex].SubItems.Strings[4]);
  end;
end;

procedure TFMain.SaveChanges(Sender:TObject;ChangeIndex:integer);
Var
  FileForUpDate:File of TTimeTable;
  FileInfo:File of TAirPlain;
  AddData:TTimeTable;
  i:integer;
begin
  ListTable.items[ChangeIndex].caption:=inttostr(SENumberFlight.value);
  ListTable.items[changeIndex].SubItems.Strings[0]:=EPlace.text;
  ListTable.items[changeIndex].SubItems.Strings[1]:=inttostr(SERange.value);
  {OXtung!!}
  ListTable.items[changeIndex].SubItems.Strings[2]:=ComboBoxAirPlain.Text;
  ListTable.items[changeIndex].SubItems.Strings[3]:=TimeToStr(timeOutPut.Time);
  ListTable.items[changeIndex].SubItems.Strings[4]:=TimeToStr(timeComing.Time);
  assignfile(FileForUpDate,'TimeTable.dat');
  rewrite(FileForUpDate);
  assignFile(FileInfo,'PlainList.dat');

  for i:=0 to ListTAble.Items.Count-1 do
  begin
    reset(FileInfo);
    adddata.numberFlight:=strtoint(ListTable.Items[i].Caption);
    adddata.place:=ListTable.Items[i].SubItems.Strings[0];
    adddata.range:=strtoint(ListTable.Items[i].SubItems.Strings[1]);

    repeat
      read(FileInfo,adddata.aircraft);
    until (ListTable.Items[i].SubItems.Strings[2]=adddata.aircraft.TypeAirPlain) or eof(FileInfo);


    adddata.timeOutPut:=strtoTime(ListTable.Items[i].SubItems.Strings[3]);
    adddata.timeComing:=strtoTime(ListTable.Items[i].SubItems.Strings[4]);
    write(FileForUpDate,AddData);
  end;
    EPlace.text:='';
    SERange.value:=0;
    SERange.value:=0;
    ComboBoxAirPlain.Text:='';
    timeOutPut.Time:=time;
    timeComing.Time:=time;
    BDel.Enabled:=true;
    BChange.Enabled:=true;
    BAddDataList.Enabled:=true;
    BSaveChanges.Enabled:=false;
    BDowloadData.Enabled:=true;


    closeFile(fileInfo);
    closeFile(FileForUpDate);
end;

procedure TFMain.BDelClick(Sender: TObject);
begin
  DeleteDateInList(FMain);
end;

procedure TFMain.BChangeClick(Sender: TObject);
begin
  printDate(FMain,ChangeIndex);
end;

procedure TFMain.BSaveChangesClick(Sender: TObject);
begin
  SaveChanges(FMain,ChangeIndex);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  BSaveChanges.Enabled:=false;
end;

procedure TFMain.SearchPlace(Sender:TObject);
Var
  FileForSearch:File of TTimeTable;
  Date:TTimeTable;
  ListItem:TlistItem;
  //ESearchPlace.text;
begin
  listSearchResult.clear;
  assignFile(FileForSearch,'TimeTable.dat');
  reset(FileForSearch);
  while not eof(FileForSearch) do
  begin
    read(FileForSearch,Date);
    If  Date.place = ESearchPlace.text then
    begin
      listSearchResult.Items.BeginUpdate;
      listItem:=listSearchResult.Items.add;
      ListItem.Caption:=inttostr(Date.numberFlight);
      ListItem.SubItems.add(TimeToStr(Date.timeOutPut));
      listSearchResult.Items.EndUpdate;
    end;
  end;
  closeFile(FileForSearch);
  ESearchPlace.text:='';
end;

procedure TFMain.BSearchPlaceClick(Sender: TObject);
begin
  SearchPlace(FMain);
end;

procedure TFMain.CalculeteOil(Sender:TObject);
Var
  FileTable:File of TTimeTable;
  Date:TTimeTable;
  Oil:real;
begin
  assignFile(FileTable,'TimeTable.dat');
  reset(FileTable);
  oil:=0;
  while not eof(FileTable) do
  begin
    read(FileTable,Date);
    Oil:=oil+date.range/1000*date.aircraft.oil
  end;

  closeFile(FileTable);
  EOilResult.Text:=inttostr(Round(Oil))+' �.';
end;


procedure TFMain.ListTableChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  CalculeteOil(Fmain);
end;


end.
