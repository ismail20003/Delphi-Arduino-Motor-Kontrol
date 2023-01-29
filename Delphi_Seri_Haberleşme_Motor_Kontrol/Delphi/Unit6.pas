unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPort, iComponent,
  iVCLComponent, iCustomComponent, iLed, iLedRound, CPortCtl, iSwitchLever;

type
  TForm6 = class(TForm)
    DURDUR: TButton;
    GERI: TButton;
    ILERI: TButton;
    ILERIL: TiLedRound;
    DURL: TiLedRound;
    GERIL: TiLedRound;
    ComBag: TiSwitchLever;
    Label1: TLabel;
    ComComboBox1: TComComboBox;
    ComPort2: TComPort;
    ComDataPacket1: TComDataPacket;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure GERIClick(Sender: TObject);
    procedure DURDURClick(Sender: TObject);
    procedure ComBagChange(Sender: TObject);
    procedure ILERIClick(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  a: Integer;
  com: Integer;
  alinan: String;

implementation

{$R *.dfm}

procedure TForm6.GERIClick(Sender: TObject);
begin
  ComPort2.WriteStr('1');
   DURL.Active:=False;
   ILERIL.Active:=False;
   GERIL.Active:=True;
   ILERI.Enabled:=False;
end;



procedure TForm6.ILERIClick(Sender: TObject);
begin
   ComPort2.WriteStr('2');
   //Durum ledlerinin aktif veya pasif olmas�
   DURL.Active:=False;
   ILERIL.Active:=True;
   GERIL.Active:=False;
   // Geri butonunun aktif veya pasif olmas�
   GERI.Enabled:=False;
end;

procedure TForm6.ComBagChange(Sender: TObject);
begin
    if ComBag.Active then
       begin
         // Switch a��ld� ise
         Label1.Color:=clLime; // Label ye�il renkli
         ComPort2.Connected:=True; // ComPort ba�lant�s� a��ld�
         ILERI.Enabled:=True; // Motor kontrol butonlar� aktif edildi
         GERI.Enabled:=True;
         DURDUR.Enabled:=True;
       end
    else
       begin
         // Switch kapand� ise
         // Motor u durdurmak
         ComPort2.WriteStr('4');
         Label1.Color:=clRed;//Label k�rm�z� renkli
         ComPort2.Connected:=False; // ComPort ba�lant�s� kapand�
         ILERI.Enabled:=False;// Motor kontrol butonlar� aktif de�il
         GERI.Enabled:=False;
         DURDUR.Enabled:=False;
         // Ledlerin hepsinin kapanmas�
         DURL.Active:=False;
         ILERIL.Active:=False;
         GERIL.Active:=False;

       end;
 end;


procedure TForm6.ComDataPacket1Packet(Sender: TObject; const Str: string);
begin
  //Seri portdan veri gelince onu memo bile�enine yazmak
  alinan := Str;
  Memo1.Lines.Add(alinan);
end;

procedure TForm6.DURDURClick(Sender: TObject);
begin
   ComPort2.WriteStr('0');
   ILERI.Enabled:=True;
   GERI.Enabled:=True;
   DURL.Active:=True;
   ILERIL.Active:=False;
   GERIL.Active:=False;
 end;

procedure TForm6.FormCreate(Sender: TObject);
begin
 EnumComPorts(ComComboBox1.Items); // Comportlar ComComboBox bile�enine aktar�ld�
 ILERI.Enabled:=False;// Motor kontrol butonlar� aktif de�il
 GERI.Enabled:=False;
 DURDUR.Enabled:=False;
 Memo1.Lines.Clear;
 end;


end.
