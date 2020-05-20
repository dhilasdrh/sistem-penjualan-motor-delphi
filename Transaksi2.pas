unit Transaksi2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, jpeg, DB, ADODB,
  Menus,DateUtils, frxClass, frxDBSet;

type
  TForm9 = class(TForm)
    ADOConnection1: TADOConnection;
    Image2: TImage;
    Image3: TImage;
    Back: TButton;
    Panel1: TPanel;
    Label10: TLabel;
    Label1: TLabel;
    Edit13: TEdit;
    Edit7: TEdit;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    Label5: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label9: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Print: TButton;
    Edit10: TEdit;
    Search: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    DataMotor1: TMenuItem;
    DataPelanggan1: TMenuItem;
    ransaksi1: TMenuItem;
    Laporan1: TMenuItem;
    Save: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    frxReport1: TfrxReport;
    Add: TButton;
    Edit: TButton;
    Delete: TButton;
    Update: TButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    Edit9: TEdit;
    Edit8: TEdit;
    Label8: TLabel;
    Label11: TLabel;
    Button1: TButton;
    procedure Edit1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EditClick(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure DataMotor1Click(Sender: TObject);
    procedure DataPelanggan1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure UpdateClick(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure DeleteClick(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure Laporan1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses DaftarPelanggan, DaftarMotor, home, DataMotor, DataPelanggan, Laporan;

{$R *.dfm}

procedure TForm9.Edit1Click(Sender: TObject);
begin
  Form8.Show;
end;

procedure TForm9.Edit3Click(Sender: TObject);
begin
  Form6.Show;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
    edit13.Text:='NO-111-00'+IntToStr(ADOQuery1.RecordCount+1);
    //DateTimePicker1.Date:=DateOf(now);
    Memo1.Text:='';
    update.visible:=false;
    save.enabled:=true;
    add.enabled:=false;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm9.BackClick(Sender: TObject);
begin
    Form9.Close;
end;

procedure TForm9.SaveClick(Sender: TObject);
begin
    with ADOQuery1 do
    begin
        Open;
        Append;
        FieldByName('no_transaksi').AsString:=edit13.text;
        FieldByName('tgl_transaksi').AsString:=FormatDateTime('dd/mm/yyyy',DateTimePicker1.Date);
        FieldByName('id_pelanggan').AsString:=edit1.text;
        FieldByName('nama_pelanggan').AsString:=edit2.text;
        FieldByName('alamat').AsString:=Memo1.text;
        FieldByName('kode_motor').AsString:=edit3.text;
        FieldByName('nama_motor').AsString:=edit4.text;
        FieldByName('harga').AsString:=edit5.text;
        FieldByName('jumlah').AsString:=edit6.text;
        FieldByName('subtotal').AsString:=edit7.text;
        FieldByName('diskon').AsString:=edit8.text;
        FieldByName('total_akhir').AsString:=edit9.text;
        {FieldByName('harga').AsInteger:=StrToInt(edit5.text);
        FieldByName('jumlah').AsInteger:=StrToInt(edit6.text);
        FieldByName('total_harga').AsInteger:=StrToInt(edit7.text);
        FieldByName('jumlah_bayar').AsInteger:=StrToInt(edit8.text);
        FieldByName('kembalian').AsInteger:=StrToInt(edit9.text);}
        Post;
    end;
    MessageDlg('Data berhasil ditambahkan',mtInformation,[mbOK],0);
    update.visible:=false;
    Save.Enabled:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm9.PrintClick(Sender: TObject);
begin
    frxReport1.LoadFromFile('NotaPembayaran.fr3');
    //frxReport1.PrepareReport(); 
    frxReport1.ShowReport();
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);
begin
    with ADOQuery1 do
    begin
        edit13.Text:=FieldByName('no_transaksi').AsString;
        DateTimePicker1.Date:=FieldByName('tgl_transaksi').AsDateTime;
        edit1.Text:=FieldByName('id_pelanggan').AsString;
        edit2.Text:=FieldByName('nama_pelanggan').AsString;
        Memo1.Text:=FieldByName('alamat').AsString;
        edit3.Text:=FieldByName('kode_motor').AsString;
        edit4.Text:=FieldByName('nama_motor').AsString;
        edit5.Text:=FieldByName('harga').AsString;
        edit6.Text:=FieldByName('jumlah').AsString;
        edit7.Text:=FieldByName('total_harga').AsString;
        edit8.Text:=FieldByName('jumlah_bayar').AsString;
        edit9.Text:=FieldByName('kembalian').AsString;
    end;

    Save.visible:=true;
    Save.enabled:=false;
    update.visible:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm9.EditClick(Sender: TObject);
begin
    with ADOQuery1 do
    begin
        edit13.Text:=FieldByName('no_transaksi').AsString;
        DateTimePicker1.Date:=FieldByName('tgl_transaksi').AsDateTime;
        edit1.Text:=FieldByName('id_pelanggan').AsString;
        edit2.Text:=FieldByName('nama_pelanggan').AsString;
        Memo1.Text:=FieldByName('alamat').AsString;
        edit3.Text:=FieldByName('kode_motor').AsString;
        edit4.Text:=FieldByName('nama_motor').AsString;
        edit5.Text:=FieldByName('harga').AsString;
        edit6.Text:=FieldByName('jumlah').AsString;
        edit7.Text:=FieldByName('total_harga').AsString;
        edit8.Text:=FieldByName('jumlah_bayar').AsString;
        edit9.Text:=FieldByName('kembalian').AsString;
    end;

    Save.visible:=false;
    update.visible:=true;
    update.enabled:=true;
    add.enabled:=false;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm9.Home1Click(Sender: TObject);
begin
    Form9.Close;
    Form2.Show;
end;

procedure TForm9.DataMotor1Click(Sender: TObject);
begin
    Form9.Close;
    Form3.Show;
end;

procedure TForm9.DataPelanggan1Click(Sender: TObject);
begin
    Form9.Close;
    Form7.Show;
end;

procedure TForm9.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
    if key = #8 then
    key:=#0;
end;

procedure TForm9.UpdateClick(Sender: TObject);
begin
with ADOQuery1 do
    begin
        Open;
        Edit;
        FieldByName('no_transaksi').AsString:=edit13.text;                                        
        FieldByName('tgl_transaksi').AsString:=FormatDateTime('dd/mm/yyyy',DateTimePicker1.Date);
        FieldByName('id_pelanggan').AsString:=edit1.text;
        FieldByName('nama_pelanggan').AsString:=edit2.text;
        FieldByName('alamat').AsString:=Memo1.text;
        FieldByName('kode_motor').AsString:=edit3.text;
        FieldByName('nama_motor').AsString:=edit4.text;
        FieldByName('harga').AsString:=edit5.text;
        FieldByName('jumlah').AsString:=edit6.text;
        FieldByName('subtotal').AsString:=edit7.text;
        FieldByName('diskon').AsString:=edit8.text;
        FieldByName('total_akhir').AsString:=edit9.text;
        {FieldByName('harga').AsInteger:=StrToInt(edit5.text);
        FieldByName('jumlah').AsInteger:=StrToInt(edit6.text);
        FieldByName('total_harga').AsInteger:=StrToInt(edit7.text);
        FieldByName('jumlah_bayar').AsInteger:=StrToInt(edit8.text);
        FieldByName('kembalian').AsInteger:=StrToInt(edit9.text); }
        Post;
    end;
    MessageDlg('Data berhasil diedit',mtInformation,[mbOK],0);

    update.Visible:=false;
    save.visible:=true;
    save.enabled:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm9.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
    if key = #8 then edit8.Text:=IntToStr(0);
end;

procedure TForm9.DeleteClick(Sender: TObject);
begin
    ADOQuery1.Open;
    ADOQuery1.Delete;
    MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);
end;

procedure TForm9.AddClick(Sender: TObject);
begin
    edit13.Text:='NO-111-00'+IntToStr(ADOQuery1.RecordCount+1);
    edit1.Text:='';
    edit2.Text:='';
    Memo1.Text:='';
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='';
    edit6.Text:='';
    edit7.Text:='';
    edit8.Text:='';
    edit9.Text:='';
end;

procedure TForm9.Edit10Change(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM pemesanan WHERE id_pelanggan LIKE "'+Edit10.Text+'%" OR nama_pelanggan LIKE "%'+Edit6.Text+'%" OR no_transaksi LIKE "'+Edit6.Text+'%" OR kode_motor LIKE "'+Edit6.Text+'%"OR nama_motor LIKE "'+Edit6.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm9.SearchClick(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM pemesanan WHERE id_pelanggan LIKE "'+Edit10.Text+'%" OR nama_pelanggan LIKE "%'+Edit6.Text+'%" OR no_transaksi LIKE "'+Edit6.Text+'%" OR kode_motor LIKE "'+Edit6.Text+'%"OR nama_motor LIKE "'+Edit6.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm9.Laporan1Click(Sender: TObject);
begin
    Form5.Show;
    Form9.Close;
end;

procedure TForm9.Button1Click(Sender: TObject);
var harga, jumlah, diskon, subtotal, total : real;
begin
    harga:=StrToFloat(edit5.text);
    jumlah:=StrToFloat(edit6.Text);

    subtotal:=harga*jumlah;
    edit7.text:=FloatToStr(subtotal);
    diskon:=subtotal*0.1;
    edit8.Text:=FloatToStr(diskon);
    total:=subtotal-diskon;
    edit9.Text:=FloatToStr(total);
end;

end.
