unit DataPelanggan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, jpeg, Menus, DB,
  ADODB,DateUtils;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Image3: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit5: TEdit;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Save: TButton;
    DBGrid1: TDBGrid;
    Edit6: TEdit;
    Search: TButton;
    Add: TButton;
    Delete: TButton;
    Edit: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    DataMotor1: TMenuItem;
    Transaksi1: TMenuItem;
    Laporan1: TMenuItem;
    DataPelanggan1: TMenuItem;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Save2: TButton;
    Back: TButton;
    ADOQuery1: TADOQuery;
    procedure SaveClick(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure DataMotor1Click(Sender: TObject);
    procedure Transaksi1Click(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit6Change(Sender: TObject);
    procedure SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses home, DataMotor, Transaksi2;

{$R *.dfm}

procedure TForm7.SaveClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
      Open;
      Append;
      FieldByName('id_pelanggan').AsString:=edit1.Text;
      FieldByName('nama_pelanggan').AsString:=edit2.Text;
      FieldByName('no_identitas').AsString:=edit3.Text;
      FieldByName('jenis_kelamin').AsString:=ComboBox1.Text;
      FieldByName('tgl_lahir').AsString:=FormatDateTime('dd/mm/yyyy',DateTimePicker1.Date);
      FieldByName('alamat').AsString:=Memo1.Text;
      FieldByName('no_hp').AsString:=edit4.Text;
      FieldByName('pekerjaan').AsString:=edit5.Text;
      Post;
  end;
  save2.Visible:=false;
  save.enabled:=false;
  add.enabled:=true;
  edit.enabled:=true;
  delete.enabled:=true;
end;

procedure TForm7.Save2Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
      Open;
      Edit;
      FieldByName('id_pelanggan').AsString:=edit1.Text;
      FieldByName('nama_pelanggan').AsString:=edit2.Text;
      FieldByName('no_identitas').AsString:=edit3.Text;
      FieldByName('jenis_kelamin').AsString:=ComboBox1.Text;
      FieldByName('tgl_lahir').AsString:=FormatDateTime('dd/mm/yyyy',DateTimePicker1.Date);
      FieldByName('alamat').AsString:=Memo1.Text;
      FieldByName('no_hp').AsString:=edit4.Text;
      FieldByName('pekerjaan').AsString:=edit5.Text;
      Post;
  end;

  save2.Visible:=false;
  save.Enabled:=true;
  save.visible:=true;
  add.enabled:=false;
  edit.enabled:=false;
  delete.enabled:=false;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
    Edit1.Text:='CST00'+IntToStr(ADOQuery1.RecordCount+1);
    Memo1.Text:='';
    save.enabled:=true;
    save2.Visible:=false;
    add.enabled:=false;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm7.Home1Click(Sender: TObject);
begin
    Form7.Close;
    Form2.Show;
end;

procedure TForm7.DataMotor1Click(Sender: TObject);
begin
    Form7.Close;
    Form3.Show;
end;

procedure TForm7.Transaksi1Click(Sender: TObject);
begin
    Form7.Close;
    Form9.Show;
end;

procedure TForm7.BackClick(Sender: TObject);
begin
    Form7.Close;
end;

procedure TForm7.AddClick(Sender: TObject);
begin
    Edit1.Text:='CST00'+IntToStr(ADOQuery1.RecordCount+1);
    Edit2.Text:='';
    Edit3.Text:='';
    ComboBox1.Text:='';
    DateTimePicker1.Date:=DateOf(now);
    Memo1.Text:='';
    Edit4.Text:='';
    Edit5.Text:='';

    Save2.Visible:=false;
    save.Visible:=true;
    save.enabled:=true;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm7.EditClick(Sender: TObject);
begin
    with ADOQuery1 do
    begin
      edit1.text:=FieldByName('id_pelanggan').AsString;
      edit2.text:=FieldByName('nama_pelanggan').AsString;
      edit3.text:=FieldByName('no_identitas').AsString;
      ComboBox1.Text:=FieldByName('jenis_kelamin').AsString;
      DateTimePicker1.Date:=FieldByName('tgl_lahir').AsDateTime;
      Memo1.Text:=FieldByName('alamat').AsString;
      edit4.text:=FieldByName('no_hp').AsString;
      edit5.text:=FieldByName('pekerjaan').AsString;
    end;

    save2.visible:=true;
    save2.enabled:=true;
    save.visible:=false;
    add.enabled:=false;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm7.DeleteClick(Sender: TObject);
begin
    ADOQuery1.Open;
    ADOQuery1.Delete;
    MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
    with ADOQuery1 do
    begin
      edit1.text:=FieldByName('id_pelanggan').AsString;
      edit2.text:=FieldByName('nama_pelanggan').AsString;
      edit3.text:=FieldByName('no_identitas').AsString;
      ComboBox1.Text:=FieldByName('jenis_kelamin').AsString;
      DateTimePicker1.Date:=FieldByName('tgl_lahir').AsDateTime;
      Memo1.Text:=FieldByName('alamat').AsString;
      edit4.text:=FieldByName('no_hp').AsString;
      edit5.text:=FieldByName('pekerjaan').AsString;
    end;

    save2.visible:=false;
    save.Visible:=true;
    save.enabled:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm7.Edit6Change(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datapelanggan WHERE id_pelanggan LIKE "'+Edit6.Text+'%" OR nama_pelanggan LIKE "%'+Edit6.Text+'%" OR no_hp LIKE "'+Edit6.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm7.SearchClick(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.CLear;
    ADOQuery1.SQL.Add('SELECT * FROM datapelanggan WHERE id_pelanggan LIKE "'+Edit6.Text+'%" OR nama_pelanggan LIKE "%'+Edit6.Text+'%" OR no_hp LIKE "'+Edit6.Text+'%"');
    ADOQuery1.Open;
end;

end.
