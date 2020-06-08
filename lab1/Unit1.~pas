unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Spin;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label12: TLabel;
    Label17: TLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label18: TLabel;
    Label6: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpinEdit1DblClick(Sender: TObject);
    procedure SpinEdit2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const maxcount=2000000;

var
  Form1: TForm1;
  i: longint;
  //a-упорядоченный массив
  a:array[0..maxcount] of integer;
  //b-неупорядоченный массив
  b:array[0..maxcount] of integer;

implementation

{$R *.dfm}

procedure TForm1.SpinEdit1DblClick(Sender: TObject);
var
i:integer;
begin
i:=random (maxcount) + 1;
SpinEdit1.Text:=inttostr(i);
end;

procedure TForm1.SpinEdit2DblClick(Sender: TObject);
var
i:integer;
begin
i:=random (maxcount) + 1;
SpinEdit2.Text:=inttostr(i);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
close;
end;

//упорядоченный массив
procedure TForm1.Button2Click(Sender: TObject);

var
key,t1,t2,t3,t4,sl: integer;
begin
 sl:=-1;
 key:=(SpinEdit2.value);

  //оптимальный поиск как в неупорядоченном
  begin
  t3:=gettickcount;
  a[maxcount]:=key;
  i:=0;
   while (key<>a[i]) do begin
   i:=i+1;
   end;
   t4:=gettickcount;
   Edit5.Text:=inttostr(t4-t3);
      if i=(maxcount) then
      Edit6.Text:='нет'
      else
      Edit6.Text:=inttostr(i);
  end;

  //оптимальный поиск для упорядоченного
  begin
  t3:=gettickcount;
  a[maxcount]:=key+1;
  i:=1;
   while (key>a[i]) do
   i:=i+1;
   t4:=gettickcount;
   Edit7.Text:=inttostr(t4-t3);
      if (key=a[i]) then
      Edit8.Text:=inttostr(i)
      else
      Edit8.Text:='нет';
   end;
end;



//неупорядоченный массив
procedure TForm1.Button1Click(Sender: TObject);
var
key,t1,t2,t3,t4,sl: integer;
begin
 sl:=-1;
 key:=strtoint(SpinEdit1.text);

  //неоптимальный поиск
  t1:=gettickcount;
 for i:=1 to maxcount - 1 do begin
  if key=b[i] then begin
    sl:=i;
    break
    end;
  end;
  t2:=gettickcount;
  Edit1.Text:=inttostr(t2-t1);
  if sl=-1 then
    Edit2.Text:=('нет')
  else
    Edit2.Text:=inttostr(sl);

  //оптимальный поиск
  begin
  t3:=gettickcount;
  b[maxcount]:=key;
  i:=0;
   while (key<>b[i]) do begin
   i:=i+1;
   end;
   t4:=gettickcount;
   Edit3.Text:=inttostr(t4-t3);
      if i=(maxcount) then
      Edit4.Text:='нет'
      else
      Edit4.Text:=inttostr(i);
   end;
end;

begin
//задаем упорядоченный массив a
begin
a[1]:=1;
for i:=2 to maxcount - 1 do
a[i]:=a[i-1]+random(10);
// a[i]:=i;
end;

//задаем неупорядоченный массив b
begin
b[1]:=1;
for i:=2 to maxcount - 1 do
 b[i]:=random(maxcount);
end;



end.
