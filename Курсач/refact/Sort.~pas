unit Sort;

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
  public
  end;

var
  FSort: TFSort;

implementation

uses Main;

{$R *.dfm}

procedure TFSort.BBSortClick(Sender: TObject);
begin
  Fmain.StartSort(RGTypeSort.ItemIndex);
  Close;
end;

end.
