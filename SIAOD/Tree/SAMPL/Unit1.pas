{ WinGraphViz Demo Application

Copyright 2004-2007 Kyle Cordes  (http://kylecordes.com)

}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, StdCtrls, ExtCtrls;

type
  TTree=^branch;
  branch=record
    data:integer;
    right:TTree;
    left:Ttree;
    father:TTree;
  end;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FTempFilePath: string;
    procedure DrawPngGraphForData(Data: string);
  public
    procedure main(Sender:TObject);
    procedure createTree(Sender:TObject;Data:integer;var node:Ttree{;var strResult:string});
    procedure Straight(Sender:Tobject;node:TTree;var str:string;father:TTree;var i:integer);
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses
  WINGRAPHVIZLib_TLB;





procedure TFMain.DrawPngGraphForData(Data: string);
var
  Dot: IDot;
  Image: IBinaryImage;
  ImageFileName: string;
begin
  ImageFileName := FTempFilePath + 'image.png';
  Dot := CoDOT.Create;
  Image := Dot.ToPNG(Data);

 // Image :=Dot.ToBinaryGraph(Data,0);
  Image.Save(ImageFileName);
  WebBrowser1.Navigate('file:///' + FTempFilePath + 'image.png');
end;




function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  FTempFilePath := IncludeTrailingPathDelimiter(GetTempDirectory);
end;

procedure TFMain.createTree(Sender:TObject;Data:integer;var node:Ttree{;Var strResult:string});
begin
  if data>node.data then
  begin
    if node.right=nil then
    begin
      new(node.right);
      node.right.data:=data;
      node.right.right:=nil;
      node.right.left:=nil;
      new(node.right.father);
      node.right.father:=node;
     //strResult:=strResult+inttostr(node.data)+'->'+inttostr(node.right.data)+';';

    end
    else
    begin
      createTree(Sender,Data,Node.right{,StrResult});
    end;

  end
  else
  begin
    if  data<node.data then
    begin
      if node.left=nil then
      begin
        new(node.left);
        node.left.data:=data;
        node.left.right:=nil;
        node.left.left:=nil;
        new(node.left.father);
        node.left.father:=node;
        //StrResult:=StrResult+inttostr(node.data)+'->'+inttostr(node.left.data)+';';
      end
      else
      begin
        createTree(Sender,Data,Node.left{,StrResult});
      end;
    end;
  end;
end;

procedure TFMain.Straight(Sender:Tobject;node:TTree;var str:string;father:TTree;var i:integer);
var
  flac:boolean;
begin
  flac:=false;

  if node<>nil then
  begin
    if node.father<> nil then
      str:=str+inttostr(node.father.data)+'->'+inttostr(node.data)+';';

    Straight(Sender,node.left,str,node,i);
     Straight(Sender,node.right,str,node,i);
  end
  else
  if  father<>nil then
  begin
    str:=str+ '{'+ 'nul'+inttostr(i)+'[shape=point]'+';edge[style=invis]'+';'+inttostr(father.data)+'->'+'nul'+inttostr(i)+';' + '}';
    inc(i);
  end
end;
//str:=str+'nul'+inttostr(i)+'[shape=point]'+';'+inttostr(father.data)+'->'+'nul'+inttostr(i)+';';
              //+'{'+'edge[style=invis]
procedure TFMain.main(Sender:Tobject);
Const
  MassData:array[1..10] of integer =
  (22,8,4,7,9,3,2,1,10,6);
  //(1,2,3,4,5,6,7,8,9,10);
Var
  Root:TTree;
  Tree:TTree;
  i:integer;
  str:string;
begin
  new(Root);
  root.right:=nil;
  root.left:=nil;
  Root.data:=MassData[1];
  root.father:=nil;
  str:='digraph G {nodesep=0.4; ranksep=0.5;';
  for i:=2 to 10 do
  begin
    createTree(Sender,massData[i],root{,str});
  end;
  Straight(Sender,root,str,nil,i);
  str:=str+'}';

  DrawPngGraphForData(str);

end;





procedure TFMain.Button1Click(Sender: TObject);
begin
  main(FMain);
end;

end.

