unit Laporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, jpeg, DB, ADODB,
  Menus, frxClass, frxDBSet;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Image3: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Button3: TButton;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    DataMotor1: TMenuItem;
    DataPelanggan1: TMenuItem;
    ransaksi1: TMenuItem;
    Laporan1: TMenuItem;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure Button3Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure DataMotor1Click(Sender: TObject);
    procedure DataPelanggan1Click(Sender: TObject);
    procedure ransaksi1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses home, DataMotor, DataPelanggan, Transaksi2;

{$R *.dfm}

procedure TForm5.Button3Click(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT no_transaksi, tgl_transaksi, id_pelanggan, kode_motor, nama_motor, jumlah, total_harga from pemesanan WHERE ((tgl_transaksi) between "'+FormatDateTime('dd/mm/yyyy',DateTimePicker1.Date)+'" AND "'+FormatDateTime('dd/mm/yyyy',DateTimePicker2.Date)+'") ORDER BY no_transaksi');
    ADOQuery1.Open;
    if  adoquery1.RecordCount > 0 then
        adoquery1.Open
    else
    Application.MessageBox('Tidak ada data penjualan di tanggal tersebut','Info', mb_Ok + Mb_ICONINFORMATION);
end;

procedure TForm5.Home1Click(Sender: TObject);
begin
    Form5.Close;
    Form2.Show;
end;

procedure TForm5.DataMotor1Click(Sender: TObject);
begin
    Form5.Close;                   
    Form3.Show;
end;

procedure TForm5.DataPelanggan1Click(Sender: TObject);
begin
    Form5.Close;
    Form7.Show;
end;

procedure TForm5.ransaksi1Click(Sender: TObject);
begin
    Form5.Close;
    Form9.Show;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
    Form5.Close;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
    frxReport1.ShowReport();
end;

end.
