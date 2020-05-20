unit Transaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, jpeg, Menus, DB,
  ADODB, frxClass, frxDBSet;

type
  TForm4 = class(TForm)
    Image2: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button1: TButton;
    Edit11: TEdit;
    Button2: TButton;
    Edit12: TEdit;
    Image3: TImage;
    Back: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    DataMotor1: TMenuItem;
    ransaksi1: TMenuItem;
    Laporan1: TMenuItem;
    Label14: TLabel;
    DataPelanggan1: TMenuItem;
    ADOConnection1: TADOConnection;
    Edit1: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    DBGrid1: TDBGrid;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Print: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit10Click(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses DaftarPelanggan, DaftarMotor;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Append;
    FieldByName('kode_motor').AsString:=edit5.Text;     
    FieldByName('nama_motor').AsString:=edit6.Text;
    FieldByName('warna').AsString:=edit7.Text;      
    FieldByName('harga').AsInteger:=StrToInt(edit8.Text);
    FieldByName('jumlah').AsInteger:=StrToInt(edit9.Text);
    FieldByName('subtotal').AsInteger:=StrToInt(edit14.Text);
    Post;
  end;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
    Form8.Show;
end;

procedure TForm4.Edit5Click(Sender: TObject);
begin
    Form6.Show;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    edit13.Text:='NO-111-00'+IntToStr(ADOQuery2.RecordCount+1);
end;

procedure TForm4.Edit10Click(Sender: TObject);
begin
  //edit10.Text:=IntToStr(ADOQuery1.SQL.Add('SELECT SUM(harga*jumlah) FROM pemesanan'));
end;

procedure TForm4.Edit9Change(Sender: TObject);
var harga, qty, total:integer;
begin
  harga:=StrToInt(edit8.Text);
  Qty:=strtoint(edit9.Text);
  total:=harga*qty;
  Edit14.Text:=IntToStr(total);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  ADOQuery1.Open;
  ADOQuery1.Delete;
  MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);
end;

procedure TForm4.PrintClick(Sender: TObject);
begin
    frxReport1.LoadFromFile('nota.fr3');
    frxReport1.PrepareReport();
    frxReport1.ShowReport();
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
    with ADOQuery2 do
    begin
        Open;
        Append;
        FieldByName('no_transaksi').AsString:=Edit13.Text;
        FieldByName('tgl_transaksi').AsDateTime:=DateTimePicker1.Date;
        FieldByName('id_pelanggan').AsString:=Edit1.Text;
        FieldByName('nama_pelanggan').AsString:=Edit2.Text;
        FieldByName('kode_motor').AsString:=Edit5.Text;
        FieldByName('nama_motor').AsString:=Edit6.Text; 
        FieldByName('tipe').AsString:=Edit7.Text;
        FieldByName('harga').AsInteger:=StrToInt(Edit8.Text);
        FieldByName('jumlah').AsInteger:=StrToInt(Edit9.Text);
        //FieldByName('subtotal').AsInteger:=StrToInt(Edit14.Text);
        //FieldByName('total_bayar').AsInteger:=Edit13.Text;
        Post;
    end;
    //ADOQuery2.SQL.Add('Select (harga*jumlah) AS subtotal');
    //ADOQuery2.SQL.Add('Select SUM(harga*jumlah) AS total_bayar from pemesanan');
    edit10.Text:=IntToStr(ADOQuery2.SQL.Add('Select SUM(harga*jumlah) AS total_bayar from pemesanan'));
end;

end.
