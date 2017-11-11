unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFSearch = class(TForm)
    LText: TLabel;
    LJText: TLabel;
    EName: TEdit;
    BBStartSearch: TBitBtn;
    procedure BBStartSearchClick(Sender: TObject);
  private
  public
  end;

var
  FSearch: TFSearch;

implementation

uses  Main;
{$R *.dfm}

procedure TFSearch.BBStartSearchClick(Sender: TObject);
begin
  if EName.Text<>'' then
  begin
    FMain.Search(EName.Text,Fmain.HeaderList,Fmain.ListOfFilm);
    close;
  end;
end;

end.
