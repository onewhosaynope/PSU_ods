unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label10: TLabel;
    Panel5: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure SpinEdit1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const maxcount=200000000;
  const cikl=100000;

var
  Form1: TForm1;
  i: longint;
  //a-упорядоченный массив
  a:array[0..maxcount] of integer;

implementation

{$R *.dfm}

procedure TForm1.SpinEdit1DblClick(Sender: TObject);
var
i:integer;
begin
i:=random (maxcount) + 1;
SpinEdit1.Text:=inttostr(i);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
close;
end;



procedure TForm1.Button2Click(Sender: TObject);
var
l,r,i,j,key,t1,t2,t3,t4,t5,t6: integer;
begin
key:=(SpinEdit1.value);

  //неоптимальный бинарный
  begin
  j:=1;
  t1:=gettickcount;
  while j<cikl do begin
  j:=j+1;
   l:=1;r:=maxcount;
    while r>=l do begin
     i:=(r+l)div 2;
     if key=a[i] then
      break
       else begin
         if a[i]>key then
         r:=i-1
         else
         l:=i+1;
       end;
    end;

  t2:=gettickcount;
  if a[i]=key then
  Edit1.text:=inttostr(i)
  else
  Edit1.Text:='нет';
  Edit2.Text:=inttostr(t2-t1);
  end;
   end;



  //оптимальный бинарный
  begin
  L:=1;
  R:=maxcount;

   while (R>L) do begin
    i:=((L+R) div 2);
    if (key<=a[i]) then
    R:=i
    else
    L:=i+1;
   end;
    if (a[R]=key) then
    Edit3.text:=inttostr(r)
    else
    Edit3.Text:=('нет');
    end;

  //оптимальный последовательный
  begin
  t5:=gettickcount;

  while j<10000 do begin
  j:=j+1;
  a[maxcount]:=key+1;
  i:=1;
   while (key>a[i]) do
   i:=i+1;
   end;
   t6:=gettickcount;
   Edit6.Text:=inttostr(t6-t5);
      if (key=a[i]) then
      Edit5.Text:=inttostr(i)
      else
      Edit5.Text:='нет';
   end;


end;

begin
  //задаем упорядоченный массив a
  begin
  a[1]:=1;
  for i:=2 to maxcount - 1 do
  a[i]:=a[i-1]+random(6);
  end;
  
end.
