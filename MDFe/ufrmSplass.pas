unit ufrmSplass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmSplass = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    Image3: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplass: TfrmSplass;

implementation

{$R *.dfm}

procedure TfrmSplass.FormActivate(Sender: TObject);
begin

 ProgressBar1.Position := 0;
  while ProgressBar1.Position < 100 do
  begin
    ProgressBar1.Position:= ProgressBar1.Position + 10;
    case ProgressBar1.Position of
      10 : label1.Caption := 'Carregando...';
      20 : label1.Caption := 'Abrindo Arquivos...';
      30 : label1.Caption := 'Carregando o Banco de Dados...';
    end;
    frmSplass.Update;
    Sleep(500);
  end;
  label1.Caption := 'Inicializando o programa...';
  frmSplass.Update;
  Sleep(200)
//  form2.showmodal;
end;

end.
