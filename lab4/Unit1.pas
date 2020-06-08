unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, System.Actions;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
  stack = ^tstack;
  tstack = record
    sim:char;
    bot:stack;
    right:stack;
  end;

var
  Form1: TForm1;
  sroot:stack;

implementation

{$R *.dfm}

procedure AddE(var root: stack; s:string;var db:boolean; i:integer);
begin
  if (root = nil) and (i<>length(s)+1) then
  begin
    New(root);
    root^.sim := s[i];
    root^.bot := nil;
    root^.right := nil;
    db:=true;
    if i <> length(s)+1 then
      addE(root^.bot,s,db,i+1);
  end
  else
  begin
    if (i <> length(s)+1) and (root^.sim = s[i]) then
       addE(root^.bot,s,db,i+1);
    if (i <> length(s)+1) and (root^.sim <> s[i]) then
       addE(root^.right,s,db,i);
  end;
end;

procedure poisk(root:stack; s:string; var db:boolean; i:integer);
begin
  if (root<>nil)  then begin
    if (root^.sim<>s[i]) then
      poisk(root^.right,s,db,i);
    if (root^.sim = s[i]) then
      poisk(root^.bot,s,db,i+1);
  end else begin
    if i = length(s)+1 then
      db:=true;
  end;
end;

procedure tfree(var root:stack);
begin
  if root <> nil then begin
    tfree(root^.right);
    tfree(root^.bot);
    dispose(root);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var s:string;
i:integer;
ist:boolean;
begin
  Label3.Caption:='';
  ist:=false;
  if length(Edit1.Text)<>0 then begin
    s:=Edit1.Text+'*';
    adde(sroot,s,ist,1);
    if ist then begin
      Memo1.Lines.Add(Edit1.Text);
    end else
      Label3.Caption:='Слово дублированно';
    Edit1.Text:='';
  end else Label3.Caption:='Пустое слово';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  sroot:=nil;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tfree(sroot);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var s:string;
ist:boolean;
i:integer;
begin
  s:=Edit2.Text+'*';
  ist:=false;
  poisk(sroot,s,ist,1);
  if ist = false then begin
    Label3.Caption:='Слово не найдено';
  end else begin
    Edit2.Text:='';
    Label3.Caption:='Слово найдено';
  end;
end;

end.
