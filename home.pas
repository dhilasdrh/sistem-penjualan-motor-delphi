unit home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    DataMotor1: TMenuItem;
    Transaksi1: TMenuItem;
    Laporan1: TMenuItem;
    Image1: TImage;
    Home1: TMenuItem;
    DataPelanggan1: TMenuItem;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure DataMotor1Click(Sender: TObject);
    procedure Transaksi1Click(Sender: TObject);
    procedure Laporan1Click(Sender: TObject);
    procedure DataPelanggan1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses DataMotor, Laporan, DataPelanggan, Transaksi2;

{$R *.dfm}

procedure TForm2.DataMotor1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.Transaksi1Click(Sender: TObject);
begin
  Form9.Show;
end;

procedure TForm2.Laporan1Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm2.DataPelanggan1Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
    Form3.Show;
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
    Form7.Show;
end;

procedure TForm2.Image4Click(Sender: TObject);
begin
    Form9.Show;
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
    Form5.Show;
end;

end.
