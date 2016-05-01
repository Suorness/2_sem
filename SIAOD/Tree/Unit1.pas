unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TTree=^branch;
  branch=record
    data:integer;
    right:TTree;
    left:Ttree;
  end;
  TFMain = class(TForm)
    VTree: TTreeView;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure main(Sender:TObject);
    procedure createTree(Sender:TObject;Data:integer;var node:Ttree);
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}
procedure TFMain.main(Sender:Tobject);
Const
  MassData:array[1..10] of integer =
  (5,8,4,7,9,3,2,1,10,6);
Var
  Root:TTree;
  Tree:TTree;
  i:integer;
  NodeT : TTreeNode;
begin
  new(Root);
  root.right:=nil;
  root.left:=nil;
  Root.data:=MassData[1];
  NodeT:=VTree.Items.addchild(nil,inttostr(root.data));
  NodeT.getFirstChild;
  NodeT:=nodeT.GetNext;
  NodeT:=VTree.Items.addchild(nil,inttostr(root.data));
  for i:=2 to 10 do
  begin
    createTree(Sender,massData[i],root);
  end;
   //TTreeView
end;
procedure TFMain.createTree(Sender:TObject;Data:integer;var node:Ttree);
Var
  NodeT : TTreeNode;
begin
  if data>node.data then
  begin
    if node.right=nil then
    begin
      new(node.right);
      node.right.data:=data;
      node.right.right:=nil;
      node.right.left:=nil;

    end
    else
    begin
      createTree(Sender,Data,Node.right);
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
      end
      else
      begin
        createTree(Sender,Data,Node.left);
      end;
    end;
  end;
end;
procedure TFMain.Button1Click(Sender: TObject);
begin
  main(Fmain);
end;

end.
 