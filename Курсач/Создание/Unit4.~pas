unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

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
  Func = function(First,second:ListFilm):boolean;

type
  TFSort = class(TForm)
    LText: TLabel;
    BBSort: TBitBtn;
    RGTypeSort: TRadioGroup;
    procedure BBSortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSort: TFSort;

implementation

uses Unit1;

{$R *.dfm}

procedure TFSort.BBSortClick(Sender: TObject);
begin
  Fmain.StartSort(Fmain,RGTypeSort.ItemIndex);
  Close;
end;

end.
