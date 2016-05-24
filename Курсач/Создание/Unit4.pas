unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;


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
  Fmain.StartSort(RGTypeSort.ItemIndex);
  Close;
end;

end.
