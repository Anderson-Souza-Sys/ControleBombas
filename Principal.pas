unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    stbPrincipal: TStatusBar;
    MainMenu1: TMainMenu;
    Bombas1: TMenuItem;
    anque1: TMenuItem;
    CadastroTanque1: TMenuItem;
    RecargaTanque1: TMenuItem;
    Abastecimento1: TMenuItem;
    Abastecer1: TMenuItem;
    CadastrodeBombas1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatriodeRecargas1: TMenuItem;
    RelatrioderAbastecimento1: TMenuItem;
    Sair1: TMenuItem;
    SairdoSistema1: TMenuItem;
    procedure CadastroTanque1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RecargaTanque1Click(Sender: TObject);
    procedure CadastrodeBombas1Click(Sender: TObject);
    procedure Abastecer1Click(Sender: TObject);
    procedure RelatrioderAbastecimento1Click(Sender: TObject);
    procedure RelatriodeRecargas1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SairdoSistema1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EventoErro(Sender: TObject; E: Exception);
    procedure DisplayHint(Sender: TObject);

    procedure TrataRetornoErro(sErro : string);
    function fCriptografaANSI(texto: string; chave: string; var erro: string): string;
  end;

  function CriptografaANSI(texto: string; chave: string; var erro: string): string; stdcall; external 'cripto.dll';
  Function DesCriptografaANSI(texto : string; chave : string; var erro: string) : string; stdcall; external 'cripto.dll';

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ConfiguraBanco, uDmPrincipal, CadastroTanque, uGlobal, RecargaTanque,
  CadastroBomba, Abastecimento, RelatorioAbastecimento, RelatorioRecarga;

procedure TfrmPrincipal.TrataRetornoErro(sErro : string);
begin
  if Trim(sErro) <> '' then
  begin
    Erro(sErro);
    Abort;
  end;
end;{function}

function TfrmPrincipal.fCriptografaANSI(texto: string; chave: string; var erro: string): string;
Begin
  Result := CriptografaANSI(texto, chave, erro);
End;{function}

procedure TfrmPrincipal.Abastecer1Click(Sender: TObject);
begin
  if frmAbastecimento = nil then
    Application.CreateForm(TfrmAbastecimento, frmAbastecimento);{if}
  frmAbastecimento.Show;
end;{procedure}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(TfrmConfiguraBanco, frmConfiguraBanco);
frmConfiguraBanco.ShowModal;

dmPrincipal.FDC.Connected := True;
DataHora(True);
end;

procedure TfrmPrincipal.CadastrodeBombas1Click(Sender: TObject);
begin
  if frmCadastroBomba = nil then
    Application.CreateForm(TfrmCadastroBomba, frmCadastroBomba);{if}
  frmCadastroBomba.Show;
end;{procedure}

procedure TfrmPrincipal.CadastroTanque1Click(Sender: TObject);
begin
  if frmCadastroTanque = nil then
    Application.CreateForm(TfrmCadastroTanque, frmCadastroTanque);{if}
  frmCadastroTanque.Show;
end;{procedure}

procedure TfrmPrincipal.DisplayHint(Sender: TObject);
begin
  If Copy(Application.Hint, 1, 1) = ' ' Then
    stbPrincipal.Panels.Items[1].Text := Trim(Application.Hint){}
  Else
    stbPrincipal.Panels.Items[1].Text := '';{if}
end;{procedure}

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not Pergunta('Deseja fechar o programa?') Then
    CanClose := False;{if}
end;{procedure}

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  banco, ip, login, senha, porta : String;
  sErro : string;
  f     : File of TCFG;
  CFG   : TCFG;

begin
  Try
    frmPrincipal.Caption := 'Controle de Bombas - '+NOME_EMPRESA;
    Application.Title := NOME_EMPRESA;
    Application.ProcessMessages;

    ConfigPaths;

    Application.OnException := EventoErro;
    Application.OnHint := DisplayHint;

    If not FileExists(_caminhoCfgDB) Then
    Begin
      Application.CreateForm(TfrmConfiguraBanco, frmConfiguraBanco);
      frmConfiguraBanco.ShowModal;

      If frmConfiguraBanco.Tag = 1 then
      Begin
        sErro := '';

        If (Trim(frmConfiguraBanco.edtCaminho.Text) = '') or (Trim(frmConfiguraBanco.edtUsuario.Text) = '') or(Trim(frmConfiguraBanco.edtSenha.Text) = '') or(Trim(frmConfiguraBanco.edtPorta.Text) = '') then
        Begin
          Erro('Dados incompletos! A configuração para acesso ao banco de dados não pode ser efetuada.');
          Application.Terminate;
          Abort;
        End;{if}

        CFG.Caminho := CriptografaANSI(Trim(frmConfiguraBanco.edtCaminho.Text), CHAVE_CRIPTOGRAFIA, sErro);
        frmPrincipal.TrataRetornoErro(sErro);

        if Trim(frmConfiguraBanco.edtIP.Text) <> '' then
        Begin
          CFG.IP := CriptografaANSI(Trim(frmConfiguraBanco.edtIP.Text), CHAVE_CRIPTOGRAFIA, sErro);
          frmPrincipal.TrataRetornoErro(sErro);
        End Else
          CFG.IP := '';{if}

        CFG.Usuario := CriptografaANSI(frmConfiguraBanco.edtUsuario.Text, CHAVE_CRIPTOGRAFIA, sErro);
        frmPrincipal.TrataRetornoErro(sErro);

        CFG.Senha := CriptografaANSI(frmConfiguraBanco.edtSenha.Text, CHAVE_CRIPTOGRAFIA, sErro);
        frmPrincipal.TrataRetornoErro(sErro);

        CFG.Porta := CriptografaANSI(Trim(frmConfiguraBanco.edtPorta.Text), CHAVE_CRIPTOGRAFIA, sErro);
        frmPrincipal.TrataRetornoErro(sErro);

        {$I-}
        AssignFile(F, _caminhoCfgDB);
        Rewrite(F);
        Write(F, CFG);
        CloseFile(F);
        {$I+}
      End;{if}

      FreeAndNil(frmConfiguraBanco);
    End;{if}

    If not FileExists(_caminhoCfgDB) Then
    Begin
      Erro('Configuração para acesso ao banco de dados não foi efetuada.');
      Application.Terminate;
      Abort;
    End;{if}

    {$I-}
    AssignFile(f, _caminhoCfgDB);
    Reset(f);
    Read(f, CFG);

    sErro := '';

    banco := DesCriptografaANSI(CFG.Caminho, CHAVE_CRIPTOGRAFIA, sErro);
    TrataRetornoErro(sErro);

    if Trim(CFG.IP) <> '' then
    Begin
      ip := DesCriptografaANSI(CFG.IP, CHAVE_CRIPTOGRAFIA, sErro);
      TrataRetornoErro(sErro);
    End Else
      ip := '';{if}

    login := DesCriptografaANSI(CFG.Usuario, CHAVE_CRIPTOGRAFIA, sErro);
    TrataRetornoErro(sErro);
    senha := DesCriptografaANSI(CFG.Senha, CHAVE_CRIPTOGRAFIA, sErro);
    TrataRetornoErro(sErro);
    porta := DesCriptografaANSI(CFG.porta, CHAVE_CRIPTOGRAFIA, sErro);
    TrataRetornoErro(sErro);

    CloseFile(F);
    {$I+}

    If dmPrincipal.FDC.Connected Then
      dmPrincipal.FDC.Connected := False;{if}

    dmPrincipal.FDC.Params.Clear;
    dmPrincipal.FDC.Params.Append('User_Name='+login);
    dmPrincipal.FDC.Params.Append('password='+senha);
    dmPrincipal.FDC.Params.Append('Database='+banco);
    dmPrincipal.FDC.Params.Append('Port='+porta);
    dmPrincipal.FDC.Params.Append('Protocol=TCPIP');

    if Trim(ip) <> '' then
      dmPrincipal.FDC.Params.Append('Server='+ip);{if}

    dmPrincipal.FDC.Params.Append('DriverID=IB');

    dmPrincipal.FDC.Connected := True;
    DataHora(True);

  Except on E: Exception do
    Begin
      Erro('Falha na conexão com o banco de dados.'+sLineBreak+E.Message);
      Application.Terminate;
      Abort;
    End;
  End;{try}
end;{procedure}

procedure TfrmPrincipal.RecargaTanque1Click(Sender: TObject);
begin
  if frmCadastroTanque = nil then
    Application.CreateForm(TfrmRecargaTanque, frmRecargaTanque);{if}
  frmRecargaTanque.Show;
end;{procedure}

procedure TfrmPrincipal.RelatrioderAbastecimento1Click(Sender: TObject);
begin
  if frmRelatorioAbastecimento = nil then
    Application.CreateForm(TfrmRelatorioAbastecimento, frmRelatorioAbastecimento);{if}
  frmRelatorioAbastecimento.Show;
end;{procedure}

procedure TfrmPrincipal.RelatriodeRecargas1Click(Sender: TObject);
begin
  if frmRelatorioRecarga = nil then
    Application.CreateForm(TfrmRelatorioRecarga, frmRelatorioRecarga);{if}
  frmRelatorioRecarga.Show;
end;{procedure}

procedure TfrmPrincipal.SairdoSistema1Click(Sender: TObject);
begin
  Close;
end;{procedure}

procedure TfrmPrincipal.EventoErro(Sender: TObject; E: Exception);
var
  f : TextFile;
begin
  {$I-}
  Try
    AssignFile(f, _path+'errolog.txt');

    If FileExists(_path+'errolog.txt') Then
      Append(f){}
    Else
      Rewrite(f);{if}

    Writeln(f, DateTimeToStr(DataHora(True))+' | '+ E.Message);
    CloseFile(f);

    Erro('Falha no sistema! '+sLineBreak+Copy(E.Message, 1, 150)+sLineBreak+sLineBreak+
         'Se o erro persistir contate o suporte.');
  Except
    Application.Terminate;
    Abort;
  End;{try}
  {$I+}
end;{procedure}

end.
