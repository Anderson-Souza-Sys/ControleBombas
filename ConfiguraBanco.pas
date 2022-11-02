unit ConfiguraBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ExtDlgs, FireDAC.VCLUI.Wait, Vcl.Mask;

type
  TfrmConfiguraBanco = class(TForm)
    Label1: TLabel;
    btnTree: TBitBtn;
    rgTipoConexao: TRadioGroup;
    edtCaminho: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtIP: TEdit;
    lblIP: TLabel;
    lblPorta: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    btnOk: TBitBtn;
    edtPorta: TMaskEdit;
    Label2: TLabel;
    FileOpenDialog1: TFileOpenDialog;
    procedure IPKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure rgTipoConexaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnTreeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguraBanco: TfrmConfiguraBanco;

implementation

{$R *.dfm}

uses uGlobal;

procedure TfrmConfiguraBanco.btnTreeClick(Sender: TObject);
begin
  If FileOpenDialog1.Execute {dialogOpenFile.Execute} Then
    edtCaminho.Text := FileOpenDialog1.FileName;{if}
end;{procedure}

procedure TfrmConfiguraBanco.IPKeyPress(Sender: TObject; var Key: Char);
begin
  If ((Key >= Chr(48)) and (Key <= Chr(57))) or (Key = '.') Then
    Key := Key
  Else
    Key := Chr(0);{if}
end;{procedure}

procedure TfrmConfiguraBanco.FormShow(Sender: TObject);
begin
  FileOpenDialog1.DefaultFolder := ExtractFilePath(Application.ExeName);
  edtCaminho.Text := '';
  edtIP.Text := '';
  edtUsuario.Text := '';
  edtSenha.Text := '';
  edtPorta.Text := '3050';
end;{procedure}

procedure TfrmConfiguraBanco.rgTipoConexaoClick(Sender: TObject);
begin
  If rgTipoConexao.ItemIndex = 0 Then
  Begin
    lblIP.Enabled := True;
    edtIP.Enabled := True;
  End Else
  Begin
    lblIP.Enabled := False;
    edtIP.Enabled := False;
    edtIP.Text := '';
  End{if}
end;{procedure}

procedure TfrmConfiguraBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmConfiguraBanco := nil;
end;{procedure}


procedure TfrmConfiguraBanco.btnOkClick(Sender: TObject);
var
  F   : File Of TCFG;
  CFG : TCFG;
begin

  CFG.Caminho := Criptografa(edtCaminho.Text, CHAVE_CRIPTOGRAFIA);
  CFG.IP := Criptografa(edtIP.Text, CHAVE_CRIPTOGRAFIA);
  CFG.Usuario := Criptografa(edtUsuario.Text, CHAVE_CRIPTOGRAFIA);
  CFG.Senha := Criptografa(edtSenha.Text, CHAVE_CRIPTOGRAFIA);
  CFG.Porta := StrToIntDef(Trim(edtPorta.Text), 3050);

  {$I-}
  AssignFile(F,(ExtractFilePath(Application.ExeName)+'data.dat'));
  Rewrite(F);
  Write(F, CFG);
  CloseFile(F);
  {$I+}
  frmConfiguraBanco.Close;
end;{procedure}

end.
