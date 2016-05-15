unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;
Type
  TAirplain=record
    //Тип самолета
    TypeAirPlain:string[50];
    //Год выпуска
    Year:integer;
    //расход горючего на 1000 км
    oil:integer;

  end;

  TTimeTable=record
    //номер рейса
    numberFlight:integer;
    //пункт назначение
    place:string[50];
    //дальность полета
    range:integer;
    //тип самолета
    aircraft:TAirplain;
    //время вылета
    timeOutPut:TDateTime;
    //время прибытия
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

    procedure addToFileListTable(roadPlainList:string;roadTimeTable:string);
    procedure addToListTable(roadTimeTable:string);
    procedure DeleteDateInList(roadPlainList:string;roadTimeTable:string);
    procedure printDate(var ChangeIndex:integer);
    procedure SaveChanges(ChangeIndex:integer;roadTimeTable:string;roadPlainList:string);
    procedure SearchPlace(roadTimeTable:string);
    procedure CalculeteOil(roadTimeTable:string);
  end;

var
  ChangeIndex:integer;
  roadPlainList:string;
  roadTimeTable:string;
  FMain: TFMain;

implementation

uses Unit2;

{$R *.dfm}

procedure TFMain.ButtomListPlainClick(Sender: TObject);
begin
  flistPlain.show;
end;


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


procedure TFMain.addToFileListTable(roadPlainList:string;roadTimeTable:string);
Var
  FileForSave:File of TTimeTable;
  FileInfo:File of TAirPlain;
  AddData:TTimeTable;
  ListItem:TlistItem;
begin
  if (SENumberFlight.value <>0) and(EPlace.text <>'' ) and(SERange.value<>0 )and(ComboBoxAirPlain.text <>'' )  then
  begin
    assignFile(FileInfo,roadPlainList);
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
    assignfile(FileForSave,roadTimeTable);
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
  showmessage('Missing data');
end;
procedure TFMain.addToListTable(roadTimeTable:string);
Var
 FileForLoad:File of TTimeTable;
 AddData:TTimeTable;
 ListItem:TlistItem;
begin
  listTable.Clear;
  assignfile(FileForLoad,roadTimeTable);
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
  closefile(FileForLoad);
end;

procedure TFMain.BAddDataListClick(Sender: TObject);
begin
  addToFileListTable(roadPlainList,roadTimeTable);
end;

procedure TFMain.BDowloadDataClick(Sender: TObject);
begin
  addToListTable(roadTimeTable);
end;
procedure TFMain.DeleteDateInList(roadPlainList:string;roadTimeTable:string);
Var
 FileForUpDate:File of TTimeTable;
 AddData:TTimeTable;
 FileInfo:File of TAirPlain;
 i:integer;
begin
  if listTable.SelCount=1 then
  begin
    ListTable.DeleteSelected;
    assignfile(FileForUpDate,roadTimeTable);
    rewrite(FileForUpDate);
    assignFile(FileInfo,roadPlainList);
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
      closeFile(FileForUpDate);
      CalculeteOil(roadTimeTable);
    end
    else
      showmessage('Выделите однин тип');
end;

procedure TFMain.printDate(var ChangeIndex:integer);
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

procedure TFMain.SaveChanges(ChangeIndex:integer;roadTimeTable:string;roadPlainList:string);
Var
  FileForUpDate:File of TTimeTable;
  FileInfo:File of TAirPlain;
  AddData:TTimeTable;
  i:integer;
begin
  ListTable.items[ChangeIndex].caption:=inttostr(SENumberFlight.value);
  ListTable.items[changeIndex].SubItems.Strings[0]:=EPlace.text;
  ListTable.items[changeIndex].SubItems.Strings[1]:=inttostr(SERange.value);
  ListTable.items[changeIndex].SubItems.Strings[2]:=ComboBoxAirPlain.Text;
  ListTable.items[changeIndex].SubItems.Strings[3]:=TimeToStr(timeOutPut.Time);
  ListTable.items[changeIndex].SubItems.Strings[4]:=TimeToStr(timeComing.Time);
  assignfile(FileForUpDate,roadTimeTable);
  rewrite(FileForUpDate);
  assignFile(FileInfo,roadPlainList);

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
  CalculeteOil(roadTimeTable);
end;

procedure TFMain.BDelClick(Sender: TObject);
begin
  DeleteDateInList(roadPlainList,roadTimeTable);
end;

procedure TFMain.BChangeClick(Sender: TObject);
begin
  printDate(ChangeIndex);
end;

procedure TFMain.BSaveChangesClick(Sender: TObject);
begin
  SaveChanges(ChangeIndex,roadTimeTable,roadPlainList);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  BSaveChanges.Enabled:=false;
  roadPlainList:='PlainList.dat';
  roadTimeTable:='TimeTable.dat';
end;

procedure TFMain.SearchPlace(roadTimeTable:string);
Var
  FileForSearch:File of TTimeTable;
  Date:TTimeTable;
  ListItem:TlistItem;
begin
  listSearchResult.clear;
  assignFile(FileForSearch,roadTimeTable);
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
  SearchPlace(roadTimeTable);
end;

procedure TFMain.CalculeteOil(roadTimeTable:string);
Var
  FileTable:File of TTimeTable;
  Date:TTimeTable;
  Oil:real;
begin
  assignFile(FileTable,roadTimeTable);
  reset(FileTable);
  oil:=0;
  while not eof(FileTable) do
  begin
    read(FileTable,Date);
    Oil:=oil+date.range/1000*date.aircraft.oil
  end;
  closeFile(FileTable);
  EOilResult.Text:=inttostr(Round(Oil))+' л.';
end;


procedure TFMain.ListTableChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  CalculeteOil(roadTimeTable);
end;


end.
