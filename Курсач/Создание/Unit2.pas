unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin,JPEG, ExtDlgs;


type
  TFilm=^listFilm;
  listFilm=record
    Name:string[30];
    Year:string[10];
    Genre:string[30];
    pic:string[255];
    Contry:string[30];
    Direct:string[50];
    History:string[50];
    Money:string[50];
    MoneyUp:string[50];
    Watch:string[50];
    Time:string[50];
    Disk:string[255];
    next:TFilm;
  end;

type
  TFChangeData = class(TForm)
    PanelInfo: TPanel;
    ImgPoster: TImage;
    ETitle: TEdit;
    BChangePic: TButton;
    LYear: TLabel;
    LGenre: TLabel;
    LCounty: TLabel;
    LDirerct: TLabel;
    LHistory: TLabel;
    LMoney: TLabel;
    LMoneyUp: TLabel;
    LWatch: TLabel;
    LTime: TLabel;
    LSubr: TLabel;
    CBGenre: TComboBox;
    EContry: TEdit;
    SPMoneyUp: TSpinEdit;
    SPYear: TSpinEdit;
    EDirect: TEdit;
    EHistory: TEdit;
    SPMoney: TSpinEdit;
    SPWath: TSpinEdit;
    SPTime: TSpinEdit;
    MMSubr: TMemo;
    BSaveChanges: TButton;
    BChanges: TButton;
    BSave: TButton;
    dlgAddPic: TOpenPictureDialog;
    procedure BChangePicClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BSaveChangesClick(Sender: TObject);
    procedure BChangesClick(Sender: TObject);
  private
    { Private declarations }
  public
    ImageName:string[255];
  end;

var
  FChangeData: TFChangeData;

implementation

uses  unit1;

{$R *.dfm}

procedure TFChangeData.BChangePicClick(Sender: TObject);
begin
  if not dlgAddPic.Execute then exit;
  ImageName:= dlgAddPic.Files[0];
  ImgPoster.Picture.LoadFromFile(Imagename);
end;



procedure TFChangeData.BSaveClick(Sender: TObject);
begin
  FMain.ListOfFilm:=FMain.HeaderList;
  while Fmain.ListOfFilm.next<>nil do
    Fmain.ListOfFilm:=Fmain.ListOfFilm.next;
  new(FMain.ListOfFilm.next);
  FMain.ListOfFilm:=FMain.ListOfFilm.next;
  FMain.ListOfFilm.next:=nil;
  FMain.ListOfFilm.Name:=Etitle.Text;
  FMain.ListOfFilm.Year:=inttostr(SPYear.value);
  FMain.ListOfFilm.Contry:=EContry.Text;
  FMain.ListOfFilm.Direct:=EDirect.Text;
  FMain.ListOfFilm.History:=EHistory.Text;
  Fmain.listofFilm.Genre:=CBGenre.Text;
  FMain.ListOfFilm.Money:=inttostr(SPMoney.value);
  FMain.ListOfFilm.MoneyUp:=inttostr(SPMoneyUp.Value);
  FMain.ListOfFilm.Watch:=inttostr(SPWath.value);
  FMain.ListOfFilm.Time:=inttostr(SPTime.Value);
  FMain.ListOfFilm.Disk:=MMSubr.Text;
  FMain.ListOfFilm.pic:=ImageName;
  Fmain.showLV(Fmain);
  FMain.FLagChanges:=true;
  FChangeData.Close;


end;

procedure TFChangeData.BSaveChangesClick(Sender: TObject);
begin
  FMain.ListOfFilm.Name:=Etitle.Text;
  FMain.ListOfFilm.Year:=inttostr(SPYear.value);
  FMain.ListOfFilm.Contry:=EContry.Text;
  FMain.ListOfFilm.Direct:=EDirect.Text;
  FMain.ListOfFilm.History:=EHistory.Text;
  Fmain.listofFilm.Genre:=CBGenre.Text;
  FMain.ListOfFilm.Money:=inttostr(SPMoney.value);
  FMain.ListOfFilm.MoneyUp:=inttostr(SPMoneyUp.Value);
  FMain.ListOfFilm.Watch:=inttostr(SPWath.value);
  FMain.ListOfFilm.Time:=inttostr(SPTime.Value);
  FMain.ListOfFilm.Disk:=MMSubr.Text;
  FMain.ListOfFilm.pic:=ImageName;
  FMain.FLagChanges:=true;
  Fmain.showLV(Fmain);
  FChangeData.Close;
end;

procedure TFChangeData.BChangesClick(Sender: TObject);
begin
  ETitle.Enabled:=true;
  SPYear.Enabled:=true;
  CBGenre.Enabled:=true;
  EContry.Enabled:=true;
  EDirect.Enabled:=true;
  EHistory.Enabled:=true;
  SPMoney.Enabled:=true;
  SPMoneyUp.Enabled:=true;
  SPWath.Enabled:=true;
  SPTime.Enabled:=true;
  MMSubr.Enabled:=true;
  BChangePic.Enabled:=true;
  BSaveChanges.Enabled:=true;
  BChanges.Enabled:=false;
  FChangeData.BSave.Visible:=false;
end;

end.
