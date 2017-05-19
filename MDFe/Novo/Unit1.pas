unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.ExtDlgs, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    ADODataSet1: TADODataSet;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    QConsulta: TADOQuery;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Relatrio1: TMenuItem;
    Configurao1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    Novo1: TMenuItem;
    Editar1: TMenuItem;
    Excluir1: TMenuItem;
    Fechar1: TMenuItem;
    VendedoresCadastrado1: TMenuItem;
    ConsultaporData1: TMenuItem;
    HistricoporVendedor1: TMenuItem;
    SaldoporVendedor1: TMenuItem;
    N1: TMenuItem;
    GeradordeRelatrio1: TMenuItem;
    ConexoDB1: TMenuItem;
    LayOut1: TMenuItem;
    Sistema1: TMenuItem;
    Verso1: TMenuItem;
    Usarios1: TMenuItem;
    Cadastro1: TMenuItem;
    Consulta1: TMenuItem;
    Panel3: TPanel;
    EditIdmov: TEdit;
    EditPeso: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label8: TLabel;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Button3: TButton;
    strGrid: TStringGrid;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditIdmovKeyPress(Sender: TObject; var Key: Char);
    procedure EditPesoKeyPress(Sender: TObject; var Key: Char);
    procedure bntGravarClick(Sender: TObject);
//    procedure bntAbrirClick(Sender: TObject);
//    procedure Button2Click(Sender: TObject);
//    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
var
  vArquivo : TextFile;
  vLinha,mCOD_OCOR, mTIPOREG, mFAV, mDATAPGTO,mUNIDADE: string;
  vNUMREC,vRowStrGrid, I,Cont :  integer;
  mVALOR : extended;
begin
  if (OpenDialog1.Execute) then
    begin
      for Cont := 0 to OpenDialog1.Files.Count - 1 do
        begin
// Abre o txt
          AssignFile(vArquivo,OpenDialog1.Files[Cont]);
          {$I-}
          Reset(vArquivo);
          {$I+}
{          vRowStrGrid := 1;

// Limpa StringGrid
          with strGrid do
          for I := 1 to RowCount -1 do
            Rows[I].Clear;
 }
// Loop para percorrer todo
            begin
              while not eof(vArquivo) do
                begin

// Limpa a variavel Linha
                  vLinha := '';

// Lê o conteúdo da linha atual
                  ReadLn(vArquivo,vLinha);

// Atribui valores as variaveis utilizando o comando COPY
                  mTIPOREG  := copy(vLinha,2,06);
                  mCOD_OCOR := copy(vLinha,46,06);
                  mFAV      := copy(vLinha,52,10);
                  mDATAPGTO := copy(vLinha,112,10);
                  mUNIDADE  := copy(vLinha,322,03);
                  strGrid.Cells[1,vRowStrGrid] := mTIPOREG;
                  strGrid.Cells[2,vRowStrGrid] := mCOD_OCOR;
                  strGrid.Cells[3,vRowStrGrid] := mFAV;
                  strGrid.Cells[4,vRowStrGrid] := mDATAPGTO;
                  strGrid.Cells[5,vRowStrGrid] := mUNIDADE;

// Variavel de controle de linha stringgrid
                  vRowStrGrid := vRowStrGrid + 1;
                end;
                  Closefile (vArquivo);
            end;
        end;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    If EditIdmov.text = ''  then
      begin showmessage('Por favor, digite algum valor no Identificador de Movimento'); abort;
      end;
        begin
            If EditPeso.text = ''  then
               begin showmessage('Por favor, digite algum valor no Peso'); abort;
        end;
begin
    if (MessageDlg('Deseja Atualizar Movimento nº ' +EditIdmov.text +' Com Peso de ' +EditPeso.Text, MtConfirmation, [mbYes,mbNo] , 0)= MrYes) then
      begin
      //PESO LIQUIDO
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add ('UPDATE TMOV SET PESOLIQUIDO=:peso');
        ADOQuery1.SQL.Add ('WHERE IDMOV=:mov');
        ADOQuery1.Parameters.ParamByName ('peso').Value := EditPeso.Text;
        ADOQuery1.Parameters.ParamByName ('mov').Value := EditIdmov.Text;
        ADOQuery1.ExecSQL;
     //PESO PRUTO
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add ('UPDATE TMOV SET PESOBRUTO=:peso');
        ADOQuery1.SQL.Add ('WHERE IDMOV=:mov');
        ADOQuery1.Parameters.ParamByName ('peso').Value := EditPeso.Text;
        ADOQuery1.Parameters.ParamByName ('mov').Value := EditIdmov.Text;
        ADOQuery1.ExecSQL;
     //CIDADES ESTADOS
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add ('UPDATE TCTRC SET CODETDCOLETA=''GO'',CODMUNICIPIOCOLETA=17104,CODMUNICIPIOENTREGA=CODMUNICIPIO,CODETDENTREGA=UF');
        ADOQuery1.SQL.Add ('WHERE IDMOV=:mov');
        ADOQuery1.Parameters.ParamByName ('mov').Value := EditIdmov.Text;
        ADOQuery1.ExecSQL;
        EditIdmov.Clear;
        EditPeso.Clear;
        EditIdmov.SetFocus;
        Showmessage ('Atualização Realizada com Sucesso');
      end
    else
        Showmessage ('Atualização Cancelada');
end;
end;
end;
{procedure TForm1.Button2Click(Sender: TObject);
{var
  vArquivo : TextFile;
  vLinha : string;
  mCOD_OCOR, mTIPOREG, mFAV, mDATAPGTO,mUNIDADE: string;
  vNUMREC,vRowStrGrid, I :  integer;
  mVALOR : extended;
Begin
   // Abre o txt
   AssignFile(vArquivo,Edit1.Text);
   Reset(vArquivo);
   vRowStrGrid := 1;

   // Limpa StringGrid
   with strGrid do
   for I := 1 to RowCount -1 do
   Rows[I].Clear;
    // Loop para percorrer todo txt
    while not eof(vArquivo) do
    begin
        // Limpa a variavel Linha
        vLinha := '';
        // Lê o conteúdo da linha atual
        ReadLn(vArquivo,vLinha);

        // Atribui valores as variaveis utilizando o comando COPY
        mTIPOREG  := copy(vLinha,2,06);
        mCOD_OCOR := copy(vLinha,46,06);
        mFAV      := copy(vLinha,52,10);
        mUNIDADE      := copy(vLinha,322,03);
        mDATAPGTO := copy(vLinha,112,10);// +'/'+ copy(vLinha,96,2) +'/'+ copy(vLinha,98,4);;
        //vNUMREC   := strtoint(copy(vLinha,322,3));
     //   mVALOR    := strtofloat(copy(vLinha,163,13) +','+ copy(vLinha,176,2));

        // Preenche StringGrid
        //strGrid.Cells[5,vRowStrGrid] := inttostr(vNUMREC);
        strGrid.Cells[4,vRowStrGrid] := mDATAPGTO;
        strGrid.Cells[2,vRowStrGrid] := mCOD_OCOR;
        strGrid.Cells[3,vRowStrGrid] := mFAV;
        strGrid.Cells[5,vRowStrGrid] := mUNIDADE;
     //   strGrid.Cells[5,vRowStrGrid] := FormatFloat('####,##0.00',mVALOR);
        strGrid.Cells[1,vRowStrGrid] := mTIPOREG;

     // Variavel de controle de linha stringgrid
     vRowStrGrid := vRowStrGrid + 1;
     end;

  Closefile (vArquivo);

end;
}
procedure TForm1.Button3Click(Sender: TObject);
var
SR: TSearchRec;
i: integer;
    begin
      Memo1.Lines.Clear;
      i := FindFirst('C:\sistema\ESTES\*.PED', faAnyFile, SR);
        while I = 0 do begin
            Memo1.Lines.Add(SR.Name);
            i := FindNext(SR);
    end; // while
end;
{
procedure TForm1.Button4Click(Sender: TObject);
var
  vArquivo : TextFile;
  vLinha : string;
  mCOD_OCOR, mTIPOREG, mFAV, mDATAPGTO: string;
  vNUMREC,vRowStrGrid, I :  integer;
  mVALOR : extended;
Begin
   // Abre o txt
   AssignFile(vArquivo,Edit1.Text);
   Reset(vArquivo);
   vRowStrGrid := 1;

   // Limpa StringGrid
   with strGrid do
   for I := 1 to RowCount -1 do
   Rows[I].Clear;
    // Loop para percorrer todo txt
    while not eof(vArquivo) do
    begin
        // Limpa a variavel Linha
        vLinha := '';

        // Lê o conteúdo da linha atual
        ReadLn(vArquivo,vLinha);

        // Atribui valores as variaveis utilizando o comando COPY
        mTIPOREG  := copy(vLinha,2,06);
     //   mCOD_OCOR := copy(vLinha,89,08);
     //   mFAV      := copy(vLinha,44,30);
     //   mDATAPGTO := copy(vLinha,94,2) +'/'+ copy(vLinha,96,2) +'/'+ copy(vLinha,98,4);;
     //   vNUMREC   := strtoint(copy(vLinha,135,9));
     //   mVALOR    := strtofloat(copy(vLinha,163,13) +','+ copy(vLinha,176,2));

        // Preenche StringGrid
     //   strGrid.Cells[1,vRowStrGrid] := inttostr(vNUMREC);
     //   strGrid.Cells[2,vRowStrGrid] := mDATAPGTO;
     //   strGrid.Cells[3,vRowStrGrid] := mCOD_OCOR;
     //   strGrid.Cells[4,vRowStrGrid] := mFAV;
     //   strGrid.Cells[5,vRowStrGrid] := FormatFloat('####,##0.00',mVALOR);
        strGrid.Cells[4,vRowStrGrid] := mTIPOREG;

     // Variavel de controle de linha stringgrid
     vRowStrGrid := vRowStrGrid + 1;
     end;

  Closefile (vArquivo);
end;
}
procedure TForm1.Button6Click(Sender: TObject);
var
  Arq: TextFile;
  Cont: Integer;
  Linha: String;
begin
  if (OpenDialog1.Execute) then
  begin
    for Cont := 0 to OpenDialog1.Files.Count - 1 do
    begin
      AssignFile(Arq, OpenDialog1.Files[Cont]);

      {$I-}
        Reset(Arq);
      {$I+}
       if (IOResult <> 0) then
       begin
         Memo1.Lines.Add('Erro ao ler o arquivo ' + OpenDialog1.Files[Cont]);
       end
       else
       begin
         while (not EOF(Arq)) do
         begin
           Readln(Arq, Linha);
           Memo1.Lines.Add(Linha);
         end;

         CloseFile(Arq);
       end;
    end;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  vArquivo, Arq: TextFile;
  vNUMREC,vRowStrGrid,Cont,int: Integer;
  mCOD_OCOR, mTIPOREG, mFAV, mDATAPGTO,mUNIDADE, vLinha, Linha: String;
  mVALOR : extended;
begin
  if (OpenDialog1.Execute) then
  begin
    for Cont := 0 to OpenDialog1.Files.Count - 1 do
    begin
      AssignFile(Arq, OpenDialog1.Files[Cont]);
      {$I-}
        Reset(Arq);
      {$I+}
       if (IOResult <> 0) then
  {     begin
          with strGrid do
          for int := 1 to RowCount -1 do
          Rows[int].Clear;
         while (not EOF(Arq)) do    }
         begin
        ReadLn(Arq,Linha);
// Atribui valores as variaveis utilizando o comando COPY
        mTIPOREG  := copy(Linha,2,06);
        mCOD_OCOR := copy(Linha,46,06);
        mFAV      := copy(Linha,52,10);
        mDATAPGTO := copy(Linha,112,10);
        mUNIDADE  := copy(Linha,322,03);
// Preenche StringGrid
        strGrid.Cells[1,vRowStrGrid] := mTIPOREG;
        strGrid.Cells[2,vRowStrGrid] := mCOD_OCOR;
        strGrid.Cells[3,vRowStrGrid] := mFAV;
        strGrid.Cells[4,vRowStrGrid] := mDATAPGTO;
        strGrid.Cells[5,vRowStrGrid] := mUNIDADE;
// Variavel de controle de linha stringgrid
        vRowStrGrid := vRowStrGrid + 1;
         end;
       end;
         CloseFile(Arq);
    end;
  end;
procedure TForm1.Button8Click(Sender: TObject);
var
  SR: TSearchRec;
  TxtLines,TxtFinal :TStringList;
  NomeArquivo :String;
begin
 // Dir deve ser substituído pelo diretório a pesquisar
  if FindFirst('C:\sistema\ESTES\'+'*.ped', faArchive, SR) = 0 then
  begin
    TxtLines := TStringList.Create;
    TxtFinal := TStringList.Create;
    try
      repeat
        TxtLines.LoadFromFile(SR.Name);
       // adiciona conteúdo lido ao final da
       // lista de concatenação
        TxtFinal.AddStrings(TxtLines)
      until FindNext(SR) <> 0;
      FindClose(SR);
     // grava arquivos concatenados
      TxtFinal.SaveToFile('Arquivos Contatenados.txt');
    finally
      TxtLines.Free;
      TxtFinal.Free;
    end;
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  vArquivo : TextFile;
  vLinha : string;
  mCOD_OCOR, mTIPOREG, mFAV, mDATAPGTO,mUNIDADE: string;
  vNUMREC,vRowStrGrid, I,Cont :  integer;
  mVALOR : extended;
  begin
  if (OpenDialog1.Execute) then
  begin
    for Cont := 0 to OpenDialog1.Files.Count - 1 do
Begin
   // Abre o txt
   AssignFile(vArquivo,OpenDialog1.Files[Cont]);
   Reset(vArquivo);
   vRowStrGrid := 1;

   // Limpa StringGrid
   with strGrid do
   for I := 1 to RowCount -1 do
   Rows[I].Clear;
    // Loop para percorrer todo txt
    while not eof(vArquivo) do
    begin
        // Limpa a variavel Linha
        vLinha := '';
        // Lê o conteúdo da linha atual
        ReadLn(vArquivo,vLinha);

        // Atribui valores as variaveis utilizando o comando COPY
        mTIPOREG  := copy(vLinha,2,06);
        mCOD_OCOR := copy(vLinha,46,06);
        mFAV      := copy(vLinha,52,10);
        mUNIDADE      := copy(vLinha,322,03);
        mDATAPGTO := copy(vLinha,112,10);// +'/'+ copy(vLinha,96,2) +'/'+ copy(vLinha,98,4);;
        //vNUMREC   := strtoint(copy(vLinha,322,3));
     //   mVALOR    := strtofloat(copy(vLinha,163,13) +','+ copy(vLinha,176,2));

        // Preenche StringGrid
        //strGrid.Cells[5,vRowStrGrid] := inttostr(vNUMREC);
        strGrid.Cells[4,vRowStrGrid] := mDATAPGTO;
        strGrid.Cells[2,vRowStrGrid] := mCOD_OCOR;
        strGrid.Cells[3,vRowStrGrid] := mFAV;
        strGrid.Cells[5,vRowStrGrid] := mUNIDADE;
     //   strGrid.Cells[5,vRowStrGrid] := FormatFloat('####,##0.00',mVALOR);
        strGrid.Cells[1,vRowStrGrid] := mTIPOREG;

     // Variavel de controle de linha stringgrid
     vRowStrGrid := vRowStrGrid + 1;
     end;

  Closefile (vArquivo);
end;
  end;
  end;
{
procedure TForm1.bntAbrirClick(Sender: TObject);
begin
    if (OpenDialog1.Execute) then
               if (OpenDialog1.FileName <> '') then
                begin
                    Edit1.Text := OpenDialog1.FileName;
                end;
end;
}
procedure TForm1.bntGravarClick(Sender: TObject);
begin
    QConsulta.Close;
    QConsulta.SQL.Clear;
    QConsulta.SQL.Add(  'select TPRD.CODIGOPRD AS "Codigo Produto", TPRD.NOMEFANTASIA AS PRODUTO, sum(titmmov.quantidade) AS Quantidade, SUM (titmmov.quantidade*TPRD.PESOLIQUIDO) AS PESO');
    QConsulta.SQL.Add('from Tmov (NOLOCK) left outer join fcfo (NOLOCK)');
    QConsulta.SQL.Add('on (tmov.codcfo=fcfo.codcfo) left outer join titmmov (NOLOCK)');
    QConsulta.SQL.Add('on tmov.idmov=titmmov.idmov left outer join tprd (NOLOCK)');
    QConsulta.SQL.Add('on titmmov.idprd=tprd.idprd');
    QConsulta.SQL.Add('where  tmov.codtmv in (''2.2.01'',''2.2.03'',''1.2.04'',''2.1.04'',''2.2.10'')');
    QConsulta.SQL.Add('AND CAMPOLIVRE1 IN (''939210'',''939208'',''939207'',''31012017'')');
    QConsulta.SQL.Add('group by TPRD.CODIGOPRD,TPRD.NOMEFANTASIA');
    QConsulta.SQL.Add('order by TPRD.NOMEFANTASIA');
end;

procedure TForm1.EditIdmovKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TForm1.EditPesoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8]) then
    key :=#0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[0].Text := ' ' + FormatDateTime('hh:nn:ss',now); //
    StatusBar1.Panels[1].Text := ' ' + FormatDateTime ('dddd", "dd" de "mmmm" de "yyyy',now); //
end;

end.
