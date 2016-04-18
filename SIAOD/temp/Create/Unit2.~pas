unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    StaticText1: TStaticText;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Button1: TButton;
    Image1: TImage;
    Shape1: TShape;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  pos:integer;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  button2.Enabled:=true;
  If combobox1.ItemIndex = 0 then
  begin
    image1.Stretch:=true;
    Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florone.bmp');
    If combobox2.ItemIndex = 0 then
    begin
    pos:=14;
    shape1.Top:=352;
    shape1.left:=112;
    shape1.Visible:=true;

    end
    else
    begin
      If combobox2.ItemIndex = 1 then
      begin
        pos:=12;
        shape1.Top:=384;
        shape1.left:=200;
        shape1.Visible:=true;
      end
      else
      begin
        If combobox2.ItemIndex = 2 then
        begin
          pos:=13;
          shape1.Top:=504;
          shape1.left:=168;
          shape1.Visible:=true;
        end
        else
        begin
          If combobox2.ItemIndex = 3 then
          begin
            pos:=11;
            shape1.Top:=440;
            shape1.left:=40;
            shape1.Visible:=true;
          end;
        end;
      end
    end;
  end
  else
  begin
    If combobox1.ItemIndex = 1 then
    begin
      image1.Stretch:=true;
      Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortwo.bmp');
      If combobox2.ItemIndex = 0 then
      begin
        pos:=23;
        shape1.Top:=352;
        shape1.left:=112;
        shape1.Visible:=true;
      end
      else
      begin
        If combobox2.ItemIndex = 1 then
        begin
          pos:=22;
          shape1.Top:=352;
          shape1.left:=200;
          shape1.Visible:=true;
        end
        else
        begin
          If combobox2.ItemIndex = 2 then
          begin
            pos:=24;
            shape1.Top:=529;
            shape1.left:=208;
            shape1.Visible:=true;
          end
          else
          begin
            if combobox2.ItemIndex = 3 then
            begin
              pos:=21;
              shape1.Top:=464;
              shape1.left:=48;
              shape1.Visible:=true;
            end;
          end;
        end;
      end;
    end
    else
    begin
      if combobox1.ItemIndex = 2 then
      begin
        Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florthree.bmp');
        if combobox2.ItemIndex = 0 then
        begin
          pos:=34;
          shape1.Top:=384;
          shape1.Left:=200;
          shape1.Visible:=true;
        end
        else
        begin
          if combobox2.ItemIndex = 1 then
          begin
            pos:=35;
            shape1.Top:=352;
            shape1.Left:=104;
            shape1.Visible:=true;
          end
          else
          begin
            if combobox2.ItemIndex = 2 then
            begin
              pos:=31;
              shape1.Top:=512;
              shape1.Left:=72;
              shape1.Visible:=true;
            end
            else
            begin
              if combobox2.ItemIndex = 3 then
              begin
                pos:=32;
                shape1.Top:=432;
                shape1.Left:=48;
                shape1.Visible:=true;
              end
              else
              showmessage('¬ведите верно!');
              
            end;
          end;
        end;
      end;
    end;
  end;
end;


procedure TForm2.Button2Click(Sender: TObject);
begin
 if pos = 14 then
 Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florone14.bmp');
 if pos = 12 then
 Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florone12.bmp');
 if pos = 13 then
 Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florone13.bmp');
 if pos = 11 then
 Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florone11.bmp');
 if pos =23 then
 button3.Enabled:=true;
 if pos = 22 then
 begin
 button3.Enabled:=true;
 Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortwo22.bmp');
 end;
 if pos = 24 then
 begin
  button3.Enabled:=true;
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortwo24.bmp');
 end;
 if pos = 21 then
 begin
  button3.Enabled:=true;
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortwo21.bmp');
 end;
 if pos = 34 then
 begin
  button3.Enabled:=true;
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortree34.bmp');
 end;
 if pos = 35 then
 begin
  button3.Enabled:=true;
 end;
 if pos = 31 then
 begin
  button3.Enabled:=true;
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortree31.bmp');
 end;
 if pos = 32 then
 begin
  button3.Enabled:=true;
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortree32.bmp');
 end;
 if pos = 33 then
 begin
  button3.Enabled:=true;
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\flortree33.bmp');
 end;
 end;





procedure TForm2.Button3Click(Sender: TObject);
begin
  Image1.Picture.LoadFromFile('C:\Users\Mike\Desktop\SIAOD\florone14.bmp');
  shape1.Top:=352;
  shape1.left:=112;
  shape1.Visible:=true;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  close;
  if button2.Enabled = true then
  form1.RichEdit2.visible:=true;
end;

end.
