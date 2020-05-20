unit DaftarMotor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB, jpeg;

type
  TForm6 = class(TForm)
    Image1: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Image2: TImage;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Transaksi, Transaksi2;

{$R *.dfm}

procedure TForm6.DBGrid1DblClick(Sender: TObject);
begin
    Form9.Edit3.Text:=ADOQuery1.FieldByName('kode_motor').AsString;
    Form9.Edit4.Text:=ADOQuery1.FieldByName('nama_motor').AsString;
    Form9.Edit5.Text:=ADOQuery1.FieldByName('harga').AsString;
    Form6.Close;
end;

procedure TForm6.Edit1Change(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datamotor WHERE kode_motor LIKE "'+Edit1.Text+'%" OR nama_motor LIKE "%'+Edit1.Text+'%" OR tipe LIKE "'+Edit1.Text+'%" OR tahun LIKE "'+Edit1.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datamotor WHERE kode_motor LIKE "'+Edit1.Text+'%" OR nama_motor LIKE "%'+Edit1.Text+'%" OR tipe LIKE "'+Edit1.Text+'%" OR tahun LIKE "'+Edit1.Text+'%"');
    ADOQuery1.Open;
end;

end.
