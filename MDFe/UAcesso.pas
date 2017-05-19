unit UAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    editUsuario: TEdit;
    editSenha: TEdit;
    btAcesso: TButton;
    btCancelar: TButton;
    ADOLogin: TADOConnection;
    DSLogin: TADODataSet;
    QLogin: TADOQuery;
    QLoginLOG_CODIGO: TIntegerField;
    QLoginLOG_NOME: TStringField;
    QLoginLOG_SENHA: TStringField;
    QLoginLOG_ATIVO: TSmallintField;
    QLoginLOG_NIVEL: TIntegerField;
    QLoginLOG_DATA: TDateTimeField;
    QLoginLOG_ADM: TStringField;
    QLoginLOG_TAB1: TIntegerField;
    QLoginLOG_TAB2: TStringField;
    SLogin: TDataSource;
    PopupMenu1: TPopupMenu;
    NovoBancodeDados1: TMenuItem;
    OpenDialog1: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
