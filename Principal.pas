unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls;

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
    procedure FormShow(Sender: TObject);
    procedure CadastroTanque1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RecargaTanque1Click(Sender: TObject);
    procedure CadastrodeBombas1Click(Sender: TObject);
    procedure Abastecer1Click(Sender: TObject);
    procedure RelatrioderAbastecimento1Click(Sender: TObject);
    procedure RelatriodeRecargas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EventoErro(Sender: TObject; E: Exception);
    procedure DisplayHint(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ConfiguraBanco, uDmPrincipal, CadastroTanque, uGlobal, RecargaTanque,
  CadastroBomba, Abastecimento, RelatorioAbastecimento, RelatorioRecarga;

procedure TfrmPrincipal.Abastecer1Click(Sender: TObject);
begin
  if frmAbastecimento = nil then
    Application.CreateForm(TfrmAbastecimento, frmAbastecimento);{if}
  frmAbastecimento.Show;
end;{procedure}

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
  banco, ip, login, senha : String;
  porta : Integer;
  f   : File of TCFG;
  CFG : TCFG;

begin
  Try
    Application.Title := NOME_EMPRESA;
    frmPrincipal.Caption := 'Controle de Bombas - '+NOME_EMPRESA;

    _path := ExtractFilePath(Application.ExeName);

    Application.OnException := EventoErro;
    Application.OnHint := DisplayHint;

    If not FileExists(_path+'data.dat') Then
    Begin
      Application.CreateForm(TfrmConfiguraBanco, frmConfiguraBanco);
      frmConfiguraBanco.ShowModal;
    End;{if}

    {$I-}
    If not FileExists(_path+'data.dat') Then
    Begin
      Erro('Configuração para acesso ao banco de dados não foi efetuada.');
      Application.Terminate;
      Abort;
    End;{if}

    AssignFile(f, _path+'data.dat');
    Reset(f);
    Read(f, CFG);
    banco := DesCriptografa(CFG.Caminho, CHAVE_CRIPTOGRAFIA);
    ip := DesCriptografa(CFG.IP, CHAVE_CRIPTOGRAFIA);
    login := DesCriptografa(CFG.Usuario, CHAVE_CRIPTOGRAFIA);
    senha := DesCriptografa(CFG.Senha, CHAVE_CRIPTOGRAFIA);
    porta := CFG.Porta;

    CloseFile(F);
    {$I+}

    If dmPrincipal.FDC.Connected Then
      dmPrincipal.FDC.Connected := False;{if}

    dmPrincipal.FDC.Params.Clear;
    dmPrincipal.FDC.Params.Append('User_Name='+login);
    dmPrincipal.FDC.Params.Append('password='+senha);
    dmPrincipal.FDC.Params.Append('Database='+banco);
    dmPrincipal.FDC.Params.Append('Port='+IntToStr(porta));
    dmPrincipal.FDC.Params.Append('Protocol=TCPIP');

    if Trim(ip) <> '' then
      dmPrincipal.FDC.Params.Append('Server='+ip);{if}

    dmPrincipal.FDC.Params.Append('DriverID=IB');

    dmPrincipal.FDC.Connected := True;
    DataHora(True);
  Except on E: Exception do
    Begin
      Erro('Falha na conexão ao banco de dados.'+#13+E.Message);
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

    Erro('Falha no sistema! '+Chr(13)+Copy(E.Message, 1, 150)+#13+#13+
         'Se o erro persistir contate o suporte.');

    //dmPrincipal.FDT.Connection.Connected := False;
    //dmPrincipal.FDC.Connected := False;
  Except
    Application.Terminate;
    Abort;
  End;{try}
  {$I+}
end;{procedure}

end.
