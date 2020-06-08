unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls,Math, Spin, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    StringGrid2: TStringGrid;
    Button3: TButton;
    StringGrid3: TStringGrid;
    Button4: TButton;
    StringGrid4: TStringGrid;
    TabSheet6: TTabSheet;
    StringGrid5: TStringGrid;
    Button5: TButton;
    StringGrid6: TStringGrid;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const n = 10;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  StringGrid6.Cells[1,0]:='Сравнения';
  StringGrid6.Cells[2,0]:='Перестановки';
  StringGrid6.Cells[3,0]:='Время';
  StringGrid6.Cells[0,1]:='Обмен';
  StringGrid6.Cells[0,2]:='Выбор';
  StringGrid6.Cells[0,3]:='Включение';
  StringGrid6.Cells[0,4]:='Шелла';
  StringGrid6.Cells[0,5]:='Линейная';
end;

procedure TForm1.Button1Click(Sender: TObject);   //метод обмена
var i,f:integer;
s:array[1..n] of integer;
zam:integer;         //ячейка для замещаемого элемента
sort:boolean;       //нужно для проверки прохождения обмена
begin
  for i:=1 to n do begin
    s[i]:=random(10*n);     //заполнение массива
    StringGrid1.Cells[i,0] := IntToStr(s[i]);
  end;
  for i:=1 to n do                //очистка строки
    StringGrid1.rows[i].Clear;
  f:=0;                     //
  sort :=true;             //переменная будет использоваться ниже в коде для фиксирования наличия обмена
  while sort and (f <> n-1) do begin    //while работает при наличии в условии верных(правдивых) элементов
    sort:=false;                        //ставится ЛОЖЬ для того что бы ниже при наличии удачного обмена поменяться обратно на ПРАВДУ
    for i:=1 to n-f-1 do                //
      if s[i]>s[i+1] then begin
        zam := s[i];
        s[i]:=s[i+1];
        s[i+1]:=zam;
        sort:=true;
      end;
    f:=f+1;
    StringGrid1.Cells[0,f] := IntToStr(f);
    for i:=1 to n do
      StringGrid1.Cells[i,f]:= IntToStr(s[i]);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);             //методом выбора
var s:array[1..n] of integer;
i,j:integer;
max,imax:integer;
begin
  for i:=1 to n do begin                     //заполнение массива
    s[i]:=random(10*n);
    StringGrid2.Cells[i,0] := IntToStr(s[i]);
  end;
  for i:=1 to n do
    StringGrid2.rows[i].Clear;
  j:=n;
  while j>1 do begin   //ищем максимальный элемент массива через цикл
    max:=-MaxInt;             //в переменную max вписывается самое минимальное значения для данного типа данных
    for i:=1 to j do        //сам цикл сортировки. процесс идет в командах ниже
      if s[i]>max then begin   //если элемент массива больше максимального
        max:=s[i];            //то он становится максимальным
        imax:=i;              //запоминаем номер максимального элемента
      end;
    s[imax]:=s[j];    //элемент под максимальным номером становится равен последнему 
    s[j]:=max;        //
    j:=j-1;
    StringGrid2.Cells[0,n-j] := IntToStr(n-j);
    for i:=1 to n do
      StringGrid2.Cells[i,n-j]:= IntToStr(s[i]);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);            //прямым включением
var s:array[0..n] of integer;
i,j:integer;
begin
  for i:=1 to n do begin       //заполнение массива
    s[i]:=random(10*n);
    StringGrid3.Cells[i,0] := IntToStr(s[i]);
  end;
  for i:=1 to n do                 //очистка строки
    StringGrid3.rows[i].Clear;
  for j:=2 to n do begin
    i:=j-1;
    s[0]:=s[j];
    while s[0] <= s[i] do begin
      s[i+1]:=s[i];
      i:=i-1;
    end;
    s[i+1]:=s[0];
    StringGrid3.Cells[0,j-1] := IntToStr(j-1);
    for i:=1 to n do
      StringGrid3.Cells[i,j-1]:= IntToStr(s[i]);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);           //Шелла
var s:array[0..2*n] of integer;
t,i,k,j:integer;
h:array[1..3] of integer;
begin
  t := trunc(log2(2*n))-1;
  for i:=1 to 2*n do begin
    s[i]:=random(n*10);
    StringGrid4.Cells[i,0]:=IntToStr(s[i]);
  end;
  for i:=1 to 2*n do
    StringGrid4.rows[i].Clear;
  h[t]:=1;
  for k:=t-1 downto 1 do
    h[k]:=2*h[k+1]+1;

  for k:=1 to t do begin
    for j:=h[k]+1 to 2*n do begin
      i:=j-h[k];
      s[0]:=s[j];
      while (i>0) and (s[0] <= s[i]) do begin
        s[i+h[k]]:=s[i];
        i:=i-h[k];
      end;
      s[i+h[k]]:=s[0];
    end;
    StringGrid4.Cells[0,k] := IntToStr(k);
    for i:=1 to 2*n do
      StringGrid4.Cells[i,k]:= IntToStr(s[i]);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);                     //линейная
var i,k:integer;
a,b:array[1..n] of integer;
begin
  for i:=1 to n do begin    //создание массива
    a[i]:=random(n)+1;
    StringGrid5.Cells[i,0]:=IntToStr(a[i]);
    b[i] := 0;   //обнуление вспомогательного массива
  end;
  for i:=1 to n do                       //очистка строки
    StringGrid5.rows[i].Clear;

  for i:=1 to n do
    inc(b[a[i]]);
  StringGrid5.Cells[0,1]:='1';
  for i:=1 to n do
    StringGrid5.Cells[i,1]:=inttostr(b[i]);
  k:=1;
  StringGrid5.Cells[0,2]:='2';
  for i:=1 to n do begin
    if b[k] = 0 then begin
      while (b[k] = 0) do
        inc(k);
    end;
    a[i]:=k;
    b[k]:=b[k]-1;
  end;
  for i:=1 to n do
    StringGrid5.Cells[i,2]:=inttostr(a[i]);
end;

procedure TForm1.Button6Click(Sender: TObject);                     //характеристики
var i,j,k,kol,t,max,imax:integer;
sravn,time,perest:array[1..5] of integer;
t1,t2:longint;
sort:boolean;
s:array[0..100000] of integer;
h:array[0..1000]   of integer;
begin
  for i:=1 to 5 do begin
    sravn[i]:=0;
    perest[i]:=0;
  end;
  kol:=SpinEdit1.Value;
  for i:=1 to kol do begin
    s[i]:=random(kol);
  end;

  k:=0;
  sort :=true;
  t1:=GetTickCount;
  while sort and (k <> kol-1) do begin
    sort:=false;
    for i:=1 to kol-k-1 do begin
      if s[i]>s[i+1] then begin
        j := s[i];
        s[i]:=s[i+1];
        s[i+1]:=j;
        sort:=true;
        inc(perest[1]);
      end;
      inc(sravn[1]);
    end;
    k:=k+1;
  end;
  t2:=GetTickCount;
  time[1]:=t2-t1;

  for i:=1 to kol do begin
    s[i]:=random(kol);
  end;

  j:=kol;
  t1:=GetTickCount;
  while j>1 do begin
    max:=-MaxInt;
    for i:=1 to j do begin
      if s[i]>max then begin
        max:=s[i];
        imax:=i;
      end;
      inc(sravn[2]);
    end;
    s[imax]:=s[j];
    s[j]:=max;
    j:=j-1;
    inc(perest[2]);
  end;
  t2:=GetTickCount;
  time[2]:=t2-t1;

  for i:=1 to kol do begin
    s[i]:=random(kol)+1;
  end;

  t1:=GetTickCount;
  for j:=2 to kol do begin
    i:=j-1;
    s[0]:=s[j];
    if s[0] <= s[i] then
      while s[0] <= s[i] do begin
        s[i+1]:=s[i];
        i:=i-1;
        inc(perest[3]);
        inc(sravn[3]);
      end
    else inc(sravn[3]);
    s[i+1]:=s[0];
  end;
  t2:=GetTickCount;
  time[3]:=t2-t1;

  for i:=0 to kol do begin
    s[i]:=random(kol);
  end;

  t := trunc(log2(kol))-1;
  h[t]:=1;
  for i:=t-1 downto 1 do
    h[i]:=h[i+1]*2+1;
  t1:=GetTickCount;
  for k:=1 to t do begin
    for j:=h[k]+1 to kol do begin
      i:=j-h[k];
      s[0]:=s[j];
      if s[0] <= s[i] then
        while (i>0) and (s[0] <= s[i]) do begin
          s[i+h[k]]:=s[i];
          i:=i-h[k];
          inc(perest[4]);
          inc(sravn[4]);
        end
      else inc(sravn[4]);
      s[i+h[k]]:=s[0];
    end;
  end;
  t2:=GetTickCount;
  time[4]:=t2-t1;

  for i:=1 to kol do begin
    s[i]:=random(kol)+1;
    h[i] := 0;
  end;
  t1:=GetTickCount;
  for i:=1 to kol do
    inc(h[s[i]]);
  k:=1;
  for i:=1 to kol do begin
    if h[k] = 0 then begin
      while (h[k] = 0) do
        inc(k);
    end;
    s[i]:=k;
    h[k]:=h[k]-1;
  end;
  t2:=GetTickCount;
  time[5]:=t2-t1;

  for i:=1 to 5 do begin
    StringGrid6.Cells[1,i]:=inttostr(sravn[i]);
    StringGrid6.Cells[2,i]:=inttostr(perest[i]);
    StringGrid6.Cells[3,i]:=inttostr(time[i]);
  end;
end;

end.
