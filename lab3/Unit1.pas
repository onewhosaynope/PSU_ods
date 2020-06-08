unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin,Math, StdCtrls, ExtCtrls, Buttons; // , System.UITypes;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
  uk=^zap;        //указатели на запись
  zap=record           //запись
  inf:longword;          //где храниться ключ
  next:uk;                //указатель на след запись
  end;

     const n=1000;             //кол во элементов в массиве ключей и адресов
    const n1=10000;              //кол во элементов 
var
  Form1: TForm1;

      mk:array[1..n] of integer;      //массив ключей
      ma:array[1..n] of integer;      //массив адресов
      mmk:array[1..n1] of longword;
      mma:array[1..n1] of longword;
      mmz:array[1..n1] of uk;
implementation

{$R *.dfm}
  procedure op;         //функция для очищения памяти
   var
   i:longword;
   work1,work2:uk;
  begin
   for i:= 1 to n1 do begin
   work1:=mmz[i];
   while work1<>nil do begin
   work2:=work1^.next;
   dispose(work1);
   work1:=work2;
   end;

  mmz[i]:=nil; end; end;
  function hesh_del(K,M:longword):longword;     //функция хешир. делением
  begin
  hesh_del:=(K mod M)+1;                        //алгоритм деления. М делитель берется ниже в процедуре
  end;

  function hesh_sk(K,RM:longword):longword;      //функция середины квадрата
  var p,de_k,de_a:byte;
  begin
  K:=K*K;                                        //возведение ключа в квадрат
   if K<RM then begin                             //  что бы на конце не было нулей
   hesh_sk:=k+1;
   exit;
   end;                                       //Выделение целой части с помощью ф-ии Trunc
   de_k:=Trunc(Log10(K))+1;               //ишет кол-во чисел
   de_a:=Trunc(log10(RM))+1;             //размер массива
   p:=(de_k-de_a) div 2;             //урезает правую часть
   k:=k div Trunc(Power(10,p));     //
   hesh_sk:=(k mod RM)+1;              //урезает левую часть
   end;

             function hesh_sv(K,RM:longword):longword;      //функция свертывания
             var s:longword;
             begin
             s:=0;                                          //будушая сумма частей
             while (K<>0) do begin                          //пока ключ не равен нулю
             s:=s+(K mod RM);                               //сумма прибавляет правую часть ключа
             K:=K div RM;                                   //берется следующая часть ключа
             end;
                 hesh_sv:=(s mod RM)+1;                     // перенос в старший разряд
                 end;

               function hesh_um(K,RM:longword):longword;  //функция умножения
               var a:real;
               begin
               a:=(sqrt(5)-1)/2;                             //создаем константу А в диапазоне от 0 до 1
               hesh_um:=Trunc(RM*Frac(K*a))+1;                //прибавлем один,чтобы не было нуля, все значения сдвинуты на единицу
               end;


procedure TForm1.Button1Click(Sender: TObject);                             //все выводы и вычисления
    var  q_del,q_sk,q_sv, q_um,  k_del, k_sk,k_sv, k_um,adr, i,j:integer;

begin

q_del:=0; q_sk:=0;q_sv:=0; q_um:=0;                                          //счетчик quality для сравнения методов
for i:= 1 to SpinEdit1.Value do begin
   k_del:=0; k_sk:=0; k_sv:=0; k_um:=0;                                      //количество делений
            for j:= 1 to n do mk[j]:=random(65000);
            // деление
            for j:=1 to n do ma[j]:=0;
            for j:= 1 to n do begin
            adr:=hesh_del(mk[j],997);    //m = 997 чтобы уменьшить кол-во коллизий
            if ma[adr]  =0 then   ma[adr]:=1 else k_del:=k_del+1; end;
            // метод середины квадрата
                for j:=1 to n do ma[j]:=0;
            for j:= 1 to n do begin
            adr:=hesh_sk(mk[j],1000);
            if ma[adr]  =0 then   ma[adr]:=1 else k_sk:=k_sk+1; end  ;
            //  свертывание
                for j:=1 to n do ma[j]:=0;
            for j:= 1 to n do begin
            adr:=hesh_sv(mk[j],1000);
            if ma[adr] =0 then   ma[adr]:=1 else k_sv:=k_sv+1; end  ;
            //умножение
                   for j:=1 to n do ma[j]:=0;
            for j:= 1 to n do begin
            adr:=hesh_um(mk[j],1000);
            if ma[adr]  =0 then   ma[adr]:=1 else k_um:=k_um+1; end  ;
                                                                   //поиск наилучшего результата
            if(k_del<=k_sk) and (k_del<=k_sv) and (k_del<=k_um)  then q_del:=q_del+1;
                      if(k_sk<=k_del) and (k_sk<=k_sv) and (k_sk<=k_um)  then q_sk:=q_sk+1;
                         if(k_sv<=k_sk) and (k_sv<=k_del) and (k_sv<=k_um)  then q_sv:=q_sv+1;
                            if(k_um<=k_sk) and (k_um<=k_sv) and (k_um<=k_del)  then q_um:=q_um+1;
                       end;
                       Edit1.Text:=inttostr(q_del);
                            Edit2.Text:=inttostr(q_sk);            //чем меньше к тем больше кью, чем больше кью,тем лучше
                             Edit3.Text:=inttostr(q_sv);
                              Edit4.Text:=inttostr(q_um);
                              end;

procedure TForm1.Button2Click(Sender: TObject);

   var  i,adr,adr1,nv,kv,k1,k2,ks1,ks2,nv2,kv2:integer; work:uk;
begin

//  занесение
for i:=1 to n1 do mmk[i] :=random(n1)+1;
for i:=1 to n1 do mma[i]:=0;
op;
// Mетод открытой адресации
for i:= 1 to n1 do begin
adr:=hesh_um(mmk[i],n1);
adr1:=adr;
while (mma[adr]<>0) do begin
if adr=n1 then adr:=1
else adr:=adr+1;
if adr=adr1 then  begin
MessageDlg('Переполнение',mtWarning,[mbOk],0); close;
exit;
end;
end;
mma[adr]:=mmk[i];
end;
//Mетод цепочек
 for i:= 1 to n1 do begin
 adr:=hesh_um(mmk[i],n1);
 new(work);
 work^.inf:=mmk[i];
 work^.next:=mmz[adr];
 mmz[adr]:=work;
 end;

 for i:=1 to n1 do mmk[i]:=random(2*n1)+1;
 k1:=0; k2:=0;
 ks1:=0; ks2:=0;
 // Mетод открытой адресации
 nv:=gettickcount;
 for i:= 1 to n1 do begin
 adr:= hesh_um(mmk[i],n1);
 adr1:=adr;
 ks1:=ks1+1;
 while (mma[adr]<>mmk[i]) do begin
 ks1:=ks1+1;
 if mma[adr]=0 then break;
 if adr=n1 then adr:=1 else
 adr:=adr+1;
 if adr=adr1 then break; end;
 if mma[adr]=mmk[i] then k1:=k1+1;
 end;
 kv:=gettickcount;

      Edit5.text:=inttostr(kv-nv);
      Edit7.text:=inttostr(k1);
      Edit6.text:=floattostr(ks1/n1);
//Mетод цепочек
   nv2:=gettickcount;
     for i:=1 to n1 do begin
      adr:= hesh_um(mmk[i],n1);
      work:=mmz[adr];
      ks2:=ks2+1;
      while (work<>nil) do begin
      ks2:=ks2+1;
      if (work^.inf=mmk[i]) then begin
      k2:=k2+1;
      break;
      end
      else work:=work^.next;
      end;
      end;
      kv2:=gettickcount;
      edit8.text:=inttostr(kv2-nv2);
      edit10.text:=inttostr(k2);
      edit9.text:=floattostr(ks2/n1);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 Form1.Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Edit4.Clear;
     Edit5.Clear;
     Edit6.Clear;
     Edit7.Clear;
     Edit8.Clear;
     Edit9.Clear;
     Edit10.Clear;
end;

end.
