unit DaftarPelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ExtCtrls, jpeg;

type
  TForm8 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Transaksi, Transaksi2;

{$R *.dfm}

procedure TForm8.DBGrid1DblClick(Sender: TObject);
begin
    Form9.Edit1.Text:=ADOQuery1.FieldByName('id_pelanggan').AsString;
    Form9.Edit2.Text:=ADOQuery1.FieldByName('nama_pelanggan').AsString; 
    Form9.Memo1.Text:=ADOQuery1.FieldByName('alamat').AsString;
    Form8.Close;
end;

procedure TForm8.Edit1Change(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datapelanggan WHERE id_pelanggan LIKE "'+Edit1.Text+'%" OR nama_pelanggan LIKE "%'+Edit1.Text+'%" OR no_hp LIKE "'+Edit1.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datapelanggan WHERE id_pelanggan LIKE "'+Edit1.Text+'%" OR nama_pelanggan LIKE "%'+Edit1.Text+'%" OR no_hp LIKE "'+Edit1.Text+'%"');
    ADOQuery1.Open;
end;

end.
