unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFAbout = class(TForm)
    PTitle: TPanel;
    LTitle: TLabel;
    PText: TPanel;
    MMText: TMemo;
    BBClose: TBitBtn;
    procedure BBCloseClick(Sender: TObject);
  private
  public
  end;

var
  FAbout: TFAbout;

implementation

{$R *.dfm}

procedure TFAbout.BBCloseClick(Sender: TObject);
begin
  close;
end;

end.
