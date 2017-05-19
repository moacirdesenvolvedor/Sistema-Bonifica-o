program AtualizacaoMDFE;

uses
  Vcl.Forms,
  UnPrincipal in 'UnPrincipal.pas' {ForPrincipal},
  RelBoniVend in 'RelBoniVend.pas' {RelBonifVend},
  UnSobre in 'UnSobre.pas' {FrmSobre},
  UnVersao in 'UnVersao.pas' {FrmVersao},
  VendasVO in 'Vo\VendasVO.pas',
  UnControle in 'UnControle.pas' {frmControle},
  UAcesso in 'UAcesso.pas' {Form1},
  UnUsuario in 'UnUsuario.pas' {frmUsuario},
  ufrmSplass in 'ufrmSplass.pas', System.SysUtils  {frmSplass};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForPrincipal, ForPrincipal);
  Application.CreateForm(TRelBonifVend, RelBonifVend);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TFrmVersao, FrmVersao);
  Application.CreateForm(TfrmControle, frmControle);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.CreateForm(TfrmSplass, frmSplass);
  frmSplass.Show; // Mostra a Formulario
  frmSplass.refresh; // da um refresh na tela
  Sleep(2000); // Coloque na Clascula Uses SysUtils,
  frmSplass.release; // apaga a tela
  frmSplass:= nil;
  Application.Run;
end.
