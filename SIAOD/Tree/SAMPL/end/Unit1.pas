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
    thread:boolean;
  end;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Button2: TButton;
    EValue: TEdit;
    LR: TMemo;
    LS: TMemo;
    LO: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FTempFilePath: string;
    procedure DrawPngGraphForData(Data: string);
  public
    procedure main(Sender:TObject;MassData:array of integer);
    procedure main2(Sender:TObject;MassData:array of integer);
    procedure createTree(Sender:TObject;Data:integer;var node:Ttree{;var strResult:string});
    procedure Straight(Sender:Tobject;node:TTree;var str:string;father:TTree;var i:integer);
    procedure Straight2(Sender:Tobject;node:TTree;var str:string;father:TTree;var i:integer);
    procedure sew(var Node:Ttree;root:ttree);
    procedure obxod(node:ttree;root:ttree);
    procedure ToArray(sender:tObject);
    procedure right_obxod(Node:TTree;father:TTree;flacBranch:boolean;root:ttree);
    procedure simm_obxod(Node:TTree;father:TTree;flacBranch:boolean;root:ttree);
    procedure obr_obxod(Node:TTree;father:TTree;flacBranch:boolean;root:ttree);
  end;

var
  FMain: TFMain;
  arrayValue:array of integer;

implementation

{$R *.dfm}

uses
  WINGRAPHVIZLib_TLB;

//flacBranch   -true right
//              false left
procedure TFmain.right_obxod(Node:TTree;father:TTree;flacBranch:boolean;root:ttree);
begin
  if node<>nil then
  begin
    LR.text:=LR.text+ ' ('+ inttostr(node.data)+')';
    right_obxod(Node.left,node,false,root);
    right_obxod(Node.right,node,true,root);
  end;
  if node=nil then
  begin
    LR.text:=LR.text+ ' 0 '+ inttostr(father.data);
    if flacbranch then
    begin
      if father.father<>nil then
        LR.text:=LR.text+ ' '+ inttostr(father.father.data);
      while (father.father<>root)and (father.father<>nil) and (father.father.left<>father) do
      begin
        father:=father.father;
        LR.text:=LR.text+ ' '+ inttostr(father.father.data);
      end;
    end;
  end;

end;
//flacBranch   -true right
//              false left

procedure TFmain.simm_obxod(Node:TTree;father:TTree;flacBranch:boolean;root:ttree);
begin
  if node<>nil then
  begin
    Ls.text:=Ls.text+ ' '+ inttostr(node.data);
    simm_obxod(node.left,node,false,root);
    Ls.text:=Ls.text+ ' ('+ inttostr(node.data)+')';
    simm_obxod(node.right,node,true,root)
  end;
  if node = nil then

  begin
     Ls.text:=Ls.text+ ' 0 ';
     if flacBranch then
     begin
        Ls.text:=Ls.text+  ' '+ inttostr(father.data);
        while (father.father<>root)and (father.father<>nil) and (father.father.left<>father) do
      begin
          //father:=father.father;
          Ls.text:=Ls.text+ ' '+ inttostr(father.father.data);
          father:=father.father;
        end;
     end;
  end;

end;
procedure Tfmain.obr_obxod(Node:TTree;father:TTree;flacBranch:boolean;root:ttree);
begin
  if node<>nil then
  begin
    Lo.text:=Lo.text+  ' '+ inttostr(node.data);
    obr_obxod(node.left,node,false,root);
    obr_obxod(node.right,node,true,root);
    Lo.text:=Lo.text+ ' ('+ inttostr(node.data)+')';
    if (father<>nil) and (not flacbranch) then
      Lo.text:=Lo.text+ ' ' + inttostr(father.data);
  end;
  if node = nil then
  begin
    if flacBranch then
    begin
      Lo.text:=Lo.text+  ' 0 ';
    end
    else
      Lo.text:=Lo.text+  ' 0 '+inttostr(father.data);
  end;
end;


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
      node.right.thread:=false;
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
        node.left.thread:=false;
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


procedure TFMain.sew(var Node:Ttree;root:ttree);
Var
  SewItem:ttree;
begin
  if node.father<>nil then
  begin
    if node.right=nil then
    begin
      if node.father.left=node then
      begin
        node.right:=node.father;
      end
      else
      begin
        if node.father.right=node then
        begin
          sewItem:=node.father;
          //if sewItem.father<> nil then
          while (SewItem.father<>root)and(sewItem.father<>nil) and(SewItem<>sewItem.father.left)  do
          begin
            sewItem:=SewItem.father;
          end;
          if sewItem.father=nil then
            node.right:=root
          else
          node.right:=SewItem.father;
        end;
      end;
      //показывает, что это нить
      node.thread:=true;
    end

  end;

end;

procedure TFMain.obxod(Node:Ttree;root:ttree);
begin
  if node<>nil then
  begin
    obxod(Node.left,root);
    obxod(Node.right,root);
    sew(node,root);
  end;
end;

procedure TFMain.Straight2(Sender:Tobject;node:TTree;var str:string;father:TTree;var i:integer);

begin
  if node<>nil then
  begin
    if node.father<> nil then
      str:=str+inttostr(node.father.data)+'->'+inttostr(node.data)+';';

    Straight2(Sender,node.left,str,node,i);
    if node.thread then
    begin
      str:=str+inttostr(node.data)+'->'+inttostr(node.right.data)+';';
    end
    else
     Straight2(Sender,node.right,str,node,i);
  end
  else
  if  father<>nil then
  begin
    str:=str+ '{'+ 'nul'+inttostr(i)+'[shape=point]'+';edge[style=invis]'+';'+inttostr(father.data)+'->'+'nul'+inttostr(i)+';' + '}';
    inc(i);
  end
end;

procedure TFMain.main(Sender:Tobject;MassData:array of integer);
Var
  Root:TTree;
  Tree:TTree;
  i:integer;
  str:string;
begin
  new(Root);
  root.right:=nil;
  root.left:=nil;
  Root.data:=MassData[0];
  root.father:=nil;
  root.thread:=false;
  str:='digraph G {nodesep=0.1; ranksep=0.9;';
  for i:=1 to HIGH(Massdata) do
  begin
    createTree(Sender,massData[i],root{,str});
  end;
  obxod(root,root);
  Straight2(Sender,root,str,nil,i);
  str:=str+'}';

  DrawPngGraphForData(str);

end;

procedure TFMain.main2(Sender:Tobject;MassData:array of integer);
  //(5,4,9,2,7,10,6,8,3);
Var
  Root:TTree;
  Tree:TTree;
  i:integer;
  str:string;
begin
  new(Root);
  root.right:=nil;
  root.left:=nil;
  Root.data:=MassData[0];
  root.father:=nil;
  root.thread:=false;
  str:='digraph G {nodesep=0.1; ranksep=0.9;';
  for i:=1 to HIGH(Massdata) do
  begin
    createTree(Sender,massData[i],root);
  end;
  LR.text:='Прямой обход: ';
  right_obxod(root,nil,true,root);
  Ls.text:='Симметричный обход: ';
  simm_obxod(root,nil,true,root);
  Ls.text:=Ls.text+' '+inttostr(root.data);
  lo.Text:='Кольцевой обход: ';
  obr_obxod(root,nil,true,root);
  Straight(Sender,root,str,nil,i);
  str:=str+';}';

  DrawPngGraphForData(str);

end;


procedure TFmain.ToArray(sender:TObject);
var
  str:string;
  j:integer;
  i:integer;
begin
  j:=0;
  for i:=low(ArrayValue) to high(arrayValue) do
    ArrayValue[i]:=0;
  str:=EValue.text;
  for i:=1 to length(str) do
    if str[i]= ' ' then
    begin

      inc(j);
    end;

  j:=j+1;
  setlength(arrayValue,j);
  j:=0;
  for i:=1 to length(str) do
  begin
    if str[i]<> ' ' then
      arrayValue[j]:=arrayValue[j]*10+strtoint(str[i])
    else
      inc(j);
  end;
end;


procedure TFMain.Button1Click(Sender: TObject);
begin
  ToArray(Fmain);
  main(FMain,arrayValue);
end;

procedure TFMain.Button2Click(Sender: TObject);
begin
  ToArray(Fmain);
  main2(FMain,arrayValue);
end;

end.
//5 4 9 2 7 10 6 8 3
//8 6 7 4 1 12 9 14 11
