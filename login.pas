unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Image2: TImage;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses home;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var a,b: string;
begin
   a:=edit1.Text;
   b:=edit2.Text;

   if (a='admin') and (b='1234') then
    begin
      form1.Hide;
      form2.show;
      MessageDlg('Login berhasil!',mtInformation,[mbOK],0);     
    end
   else
   MessageDlg('Username atau password salah!',mtError,[mbOK],0);
end;

end.
