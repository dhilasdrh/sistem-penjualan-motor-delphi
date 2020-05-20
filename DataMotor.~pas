unit DataMotor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Menus, Buttons, DB, ExtDlgs, ADODB,jpeg;

type
  TForm3 = class(TForm)
    MainMenu1: TMainMenu;
    DataMotor1: TMenuItem;
    Transaksi1: TMenuItem;
    Laporan1: TMenuItem;
    Home1: TMenuItem;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Save: TButton;
    Image1: TImage;
    Browse: TBitBtn;
    Back: TButton;
    Delete: TButton;
    Edit: TButton;
    Add: TButton;
    Edit4: TEdit;
    Edit15: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    ADOConnection1: TADOConnection;
    Image2: TImage;
    Image3: TImage;
    Label13: TLabel;
    Label17: TLabel;
    Edit5: TEdit;
    ComboBox3: TComboBox;
    Label12: TLabel;
    Label31: TLabel;
    Edit16: TEdit;
    Label18: TLabel;
    Edit17: TEdit;
    Label19: TLabel;
    ComboBox2: TComboBox;
    Edit12: TEdit;
    Save2: TButton;
    DataPelanggan1: TMenuItem;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    procedure BrowseClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SaveClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure Transaksi1Click(Sender: TObject);
    procedure Laporan1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataPelanggan1Click(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses home, Transaksi, Transaksi2, DataPelanggan;

{$R *.dfm}

procedure TForm3.BrowseClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
     Edit18.Text:=OpenPictureDialog1.FileName;
     Image1.Picture.LoadFromFile(Edit18.Text);
  end;
  Edit18.Text:='E:\Penjualan Motor\'+Edit1.Text+'.jpg';
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  with ADOQuery1 do
  begin
   edit1.Text:=FieldByName('kode_motor').AsString;
   edit2.Text:=FieldByName('nama_motor').AsString;
   ComboBox1.Text:=FieldByName('tipe').AsString;
   //edit3.Text:=FieldByName('warna').AsString;
   edit4.Text:=FieldByName('tahun').AsString;
   edit5.Text:=FieldByName('harga').AsString;
   edit6.Text:=FieldByName('tipe_mesin').AsString;
   edit7.Text:=FieldByName('kapasitas_mesin').AsString;
   ComboBox2.Text:=FieldByName('jumlah_silinder').AsString;
   ComboBox3.Text:=FieldByName('sistem_starter').AsString;
   edit8.Text:=FieldByName('bahan_bakar').AsString;
   edit9.Text:=FieldByName('kapasitas_tangki').AsString;
   edit10.Text:=FieldByName('tenaga_maks').AsString;
   edit11.Text:=FieldByName('torsi_maks').AsString;
   edit12.Text:=FieldByName('tipe_rangka').AsString;
   edit13.Text:=FieldByName('berat').AsString;
   edit14.Text:=FieldByName('dimensi').AsString;
   edit15.Text:=FieldByName('tinggi_jok').AsString;
   edit16.Text:=FieldByName('ban_depan').AsString;
   edit17.Text:=FieldByName('ban_belakang').AsString;
   edit18.Text:=FieldByName('gambar').AsString;  
   end;
   Image1.Picture.LoadFromFile(ADOQuery1['gambar']);
   browse.enabled:=false;
   save.enabled:=false;
   save2.visible:=false;
   add.enabled:=true;
   edit.enabled:=true;
   delete.Enabled:=true;
end;

procedure TForm3.SaveClick(Sender: TObject);
begin
  Image1.Picture.SaveToFile('E:\Penjualan Motor\'+Edit1.Text+'.jpg');
  with ADOQuery1 do
  begin
      Open;
      Append;
      FieldByName('kode_motor').AsString:=edit1.Text;
      FieldByName('nama_motor').AsString:=edit2.Text;
      FieldByName('tipe').AsString:=ComboBox1.Text;
      //FieldByName('warna').AsString:=edit3.Text;
      FieldByName('tahun').AsString:=edit4.Text;
      FieldByName('harga').AsString:=edit5.Text;
      //FieldByName('harga').AsInteger:=StrToInt(edit5.Text);
      FieldByName('tipe_mesin').AsString:=edit6.Text;
      FieldByName('kapasitas_mesin').AsString:=edit7.Text;
      FieldByName('jumlah_silinder').AsString:=ComboBox2.Text;
      FieldByName('sistem_starter').AsString:=ComboBox3.Text;
      FieldByName('bahan_bakar').AsString:=edit8.Text;
      FieldByName('kapasitas_tangki').AsString:=edit9.Text;
      FieldByName('tenaga_maks').AsString:=edit10.Text;
      FieldByName('torsi_maks').AsString:=edit11.Text;
      FieldByName('tipe_rangka').AsString:=edit12.Text;
      FieldByName('berat').AsString:=edit13.Text;
      FieldByName('dimensi').AsString:=edit14.Text;
      FieldByName('tinggi_jok').AsString:=edit15.Text;
      FieldByName('ban_depan').AsString:=edit16.Text;
      FieldByName('ban_belakang').AsString:=edit17.Text;
      FieldByName('gambar').AsString:=edit18.Text;
      Post;
  end;
  MessageDlg('Data berhasil ditambahkan',mtInformation,[mbOK],0);
  Browse.Enabled:=false;
  Save.Enabled:=false;
  Save2.Visible:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm3.EditClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
   edit1.Text:=FieldByName('kode_motor').AsString;
   edit2.Text:=FieldByName('nama_motor').AsString;
   ComboBox1.Text:=FieldByName('tipe').AsString;
   //edit3.Text:=FieldByName('warna').AsString;
   edit4.Text:=FieldByName('tahun').AsString;
   edit5.Text:=FieldByName('harga').AsString;
   edit6.Text:=FieldByName('tipe_mesin').AsString;
   edit7.Text:=FieldByName('kapasitas_mesin').AsString;
   ComboBox2.Text:=FieldByName('jumlah_silinder').AsString;
   ComboBox3.Text:=FieldByName('sistem_starter').AsString;
   edit8.Text:=FieldByName('bahan_bakar').AsString;
   edit9.Text:=FieldByName('kapasitas_tangki').AsString;
   edit12.Text:=FieldByName('tenaga_maks').AsString;
   edit12.Text:=FieldByName('torsi_maks').AsString;
   edit12.Text:=FieldByName('tipe_rangka').AsString;
   edit13.Text:=FieldByName('berat').AsString;
   edit14.Text:=FieldByName('dimensi').AsString;
   edit15.Text:=FieldByName('tinggi_jok').AsString;
   edit16.Text:=FieldByName('ban_depan').AsString;
   edit17.Text:=FieldByName('ban_belakang').AsString;
   edit18.Text:=FieldByName('gambar').AsString;
  end;
  Image1.Picture.LoadFromFile(ADOQuery1['gambar']);
  Browse.enabled:=true;
  Save.visible:=false;
  save2.Visible:=true;
  Save2.enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm3.Save2Click(Sender: TObject);
begin
  Image1.Picture.SaveToFile('E:\Penjualan Motor\'+Edit1.Text+'.jpg');
  with ADOQuery1 do
  begin
      Open;
      Edit;
      FieldByName('kode_motor').AsString:=edit1.Text;
      FieldByName('nama_motor').AsString:=edit2.Text;
      FieldByName('tipe').AsString:=ComboBox1.Text;
      //FieldByName('warna').AsString:=edit3.Text;
      FieldByName('tahun').AsString:=edit4.Text;
      FieldByName('harga').AsString:=edit5.Text;
      //FieldByName('harga').AsInteger:=StrToInt(edit5.Text);
      FieldByName('tipe_mesin').AsString:=edit6.Text;
      FieldByName('kapasitas_mesin').AsString:=edit7.Text;
      FieldByName('jumlah_silinder').AsString:=ComboBox2.Text;
      FieldByName('sistem_starter').AsString:=ComboBox3.Text;
      FieldByName('bahan_bakar').AsString:=edit8.Text;
      FieldByName('kapasitas_tangki').AsString:=edit9.Text;
      FieldByName('tenaga_maks').AsString:=edit10.Text;
      FieldByName('torsi_maks').AsString:=edit11.Text;
      FieldByName('tipe_rangka').AsString:=edit12.Text;
      FieldByName('berat').AsString:=edit13.Text;
      FieldByName('dimensi').AsString:=edit14.Text;
      FieldByName('tinggi_jok').AsString:=edit15.Text;
      FieldByName('ban_depan').AsString:=edit16.Text;
      FieldByName('ban_belakang').AsString:=edit17.Text;
      FieldByName('gambar').AsString:=edit18.Text;
      Post;
  end;
  MessageDlg('Data berhasil diedit',mtInformation,[mbOK],0);
  Browse.Enabled:=false;
  Save.visible:=false;
  Save2.enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm3.AddClick(Sender: TObject);
begin
  ComboBox1.Text:='';
  edit1.Text:='YMH-00'+IntToStr(ADOQuery1.RecordCount+1);
  edit2.Text:='';
  //edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  edit9.Text:='';
  edit10.Text:='';
  edit11.Text:='';
  edit12.Text:='';
  edit13.Text:='';
  edit14.Text:='';
  edit15.Text:='';
  edit16.Text:='';
  edit17.Text:='';
  edit18.Text:='';
  Image1.Picture.LoadFromFile('E:\Penjualan Motor\no-image.jpg');
  Browse.enabled:=true;
  Save.Enabled:=true;
  Save2.Visible:=false;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm3.DeleteClick(Sender: TObject);
begin
    ADOQuery1.Open;
    ADOQuery1.Delete;
    MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);
end;

procedure TForm3.BackClick(Sender: TObject);
begin
  Form3.Close;
  Form2.Show;
end;

procedure TForm3.Home1Click(Sender: TObject);
begin
  Form3.Close;
  Form2.Show;
end;

procedure TForm3.Transaksi1Click(Sender: TObject);
begin
  Form3.Close;
  Form9.Show;
end;

procedure TForm3.Laporan1Click(Sender: TObject);
begin
  Form3.Close;
  Form4.Show;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
    edit1.Text:='YMH-00'+IntToStr(ADOQuery1.RecordCount+1);
    browse.Enabled:=true;
    save.enabled:=true;
    save2.visible:=false;
    add.enabled:=false;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  { if ComboBox1.Text='Matic' then
        edit1.Text:='YMH-MT0'+IntToStr(ADOTable.ComponentCount+1);
    if ComboBox1.Text='Sport' then
        edit1.Text:='YMH-SP0'+IntToStr(ADOTable1.RecordCount+1);
    if ComboBox1.Text='Bebek' then
        edit1.Text:='YMH-BB0'+IntToStr(ADOTable1.RecordCount+1);
    if ComboBox1.Text='CBU' then
        edit1.Text:='YMH-C00'+IntToStr(ADOTable1.RecordCount+1);
    if ComboBox1.Text='Maxi' then
        edit1.Text:='YMH-MX0'+IntToStr(ADOTable1.RecordCount+1); }
end;

procedure TForm3.DataPelanggan1Click(Sender: TObject);
begin
    Form7.Show;
    Form3.Close;
end;

procedure TForm3.Edit19Change(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datamotor WHERE kode_motor LIKE "'+Edit19.Text+'%" OR nama_motor LIKE "%'+Edit19.Text+'%" OR tipe LIKE "'+Edit19.Text+'%" OR tahun LIKE "'+Edit19.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datamotor WHERE kode_motor LIKE "'+Edit19.Text+'%" OR nama_motor LIKE "%'+Edit19.Text+'%" OR tipe LIKE "'+Edit19.Text+'%" OR tahun LIKE "'+Edit19.Text+'%"');
    ADOQuery1.Open;
end;

end.
