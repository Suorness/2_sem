unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFSearch = class(TForm)
    LText: TLabel;
    Label1: TLabel;
    EName: TEdit;
    BBStartSearch: TBitBtn;
    procedure BBStartSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSearch: TFSearch;

implementation

uses  unit1;
{$R *.dfm}

procedure TFSearch.BBStartSearchClick(Sender: TObject);
begin
  if EName.Text<>'' then
  begin
    FMain.Search(FMain,EName.Text);
    close;
  end;
end;

end.
