program DealerMotor;

uses
  Forms,
  login in 'login.pas' {Form1},
  home in 'home.pas' {Form2},
  DataMotor in 'DataMotor.pas' {Form3},
  Transaksi in 'Transaksi.pas' {Form4},
  Laporan in 'Laporan.pas' {Form5},
  DaftarMotor in 'DaftarMotor.pas' {Form6},
  DataPelanggan in 'DataPelanggan.pas' {Form7},
  DaftarPelanggan in 'DaftarPelanggan.pas' {Form8},
  Transaksi2 in 'Transaksi2.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
