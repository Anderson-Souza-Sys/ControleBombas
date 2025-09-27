unit CadastroTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroInheritable, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Vcl.Grids, Vcl.DBGrids, classTanque;

type
  TfrmCadastroTanque = class(TfrmCadastroInheritable)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTipoCombustivel: TEdit;
    edtValorCombustivel: TEdit;
    cmbApelidoTanque: TComboBox;
    Label4: TLabel;
    edtLitros: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cmbApelidoTanqueSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtTipoCombustivelExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtValorCombustivelExit(Sender: TObject);
    procedure edtValorCombustivelKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Tanque : TTanques;
    novo : boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroTanque: TfrmCadastroTanque;

implementation

{$R *.dfm}

uses uDmPrincipal, uGlobal;

procedure TfrmCadastroTanque.btnExcluirClick(Sender: TObject);
begin
  inherited;
  cmbApelidoTanqueSelect(Sender);

  if Tanque.Campos.ID_Tanque < 1 then
  Begin
    Erro('Tanque para exclusão não foi informado.');
    Exit;
  End;{if}

  If Pergunta('Deseja excluir este cadastro?') then
    If Tanque.Excluir Then
    Begin
      Tanque.AlimentaListaCombo(cmbApelidoTanque);
      cmbApelidoTanque.ItemIndex := 0;
      cmbApelidoTanqueSelect(Sender);
    End Else
      Erro(Tanque.Mensagem);{if/if}
end;{procedure}

procedure TfrmCadastroTanque.btnGravarClick(Sender: TObject);
var
  ok : Boolean;
begin
  inherited;
  Ok := False;
  edtValorCombustivelExit(Sender);
  edtTipoCombustivelExit(Sender);

  if Trim(cmbApelidoTanque.Text) = '' Then
  Begin
    Erro('Informe um Tanque de combustível.');
    Exit;
  End;{if}

  if novo then
  Begin
    If not Pergunta('Deseja Cadastrar este Tanque?') then
      Exit;{if}
  End else
  Begin
    if Tanque.Campos.ID_Tanque < 1 then
    Begin
      Erro('Tanque de Combustível não foi identificado para atualizar.');
      Exit;
    End;{if}

    If not Pergunta('Deseja Atualizar o cadastro deste Tanque?') then
      Exit;{if}
  End;{if}

  Tanque.Campos.Apelido_Tanque := cmbApelidoTanque.Text;
  Tanque.Campos.Tipo_Combustivel := edtTipoCombustivel.Text[1];
  Tanque.Campos.Valor_Combustivel := TextoParaValor(edtValorCombustivel.Text);

  If novo then
    Ok := Tanque.Cadastrar{}
  Else
    Ok := Tanque.Atualizar;{if}

  if not Ok then
  Begin
    Erro(Tanque.Mensagem);
    Exit;
  End;{if}

  novo := False;
  Tanque.AlimentaListaCombo(cmbApelidoTanque);
  cmbApelidoTanque.Text := Tanque.Campos.Apelido_Tanque;
  cmbApelidoTanqueSelect(Sender);
end;{procedure}

procedure TfrmCadastroTanque.btnNovoClick(Sender: TObject);
begin
  inherited;
  novo := True;
  edtValorCombustivel.Text := '0,00';
  cmbApelidoTanque.SetFocus;
end;{procedure}

procedure TfrmCadastroTanque.cmbApelidoTanqueSelect(Sender: TObject);
begin
  inherited;
  if not novo then
  Begin
    if (Trim(cmbApelidoTanque.Text) <> '') and (not Tanque.Localizar(cmbApelidoTanque.Text)) Then
    Begin
      Erro(Tanque.Mensagem);
      edtTipoCombustivel.Text := ' ';
      edtLitros.Text := '0,000';
      edtValorCombustivel.Text := '0,00';
    End Else
    Begin
      cmbApelidoTanque.Text := Tanque.Campos.Apelido_Tanque;
      edtTipoCombustivel.Text := Tanque.Campos.Tipo_Combustivel;
      edtLitros.Text := FloatToStrF(Tanque.Campos.Litros, ffNumber, 10, 3);
      edtValorCombustivel.Text := FloatToStrF(Tanque.Campos.Valor_Combustivel, ffNumber, 10, 2);
    End;{if}
  End;{if}
end;{procedure}

procedure TfrmCadastroTanque.edtValorCombustivelExit(Sender: TObject);
begin
  inherited;
  edtValorCombustivel.Text := FormataValor(edtValorCombustivel.Text);
end;{procedure}

procedure TfrmCadastroTanque.edtValorCombustivelKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  KeyValor(Key, edtValorCombustivel);
end;{procedure}

procedure TfrmCadastroTanque.edtTipoCombustivelExit(Sender: TObject);
begin
  inherited;
  if (edtTipoCombustivel.Text <> 'G') and (edtTipoCombustivel.Text <> 'D') then
  Begin
    Erro('Só pemitido tipo de combustível "G" = Gasolina / "D" = Diesel');
    Abort;
  End;{if}
end;{procedure}

procedure TfrmCadastroTanque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Tanque);

  Action := caFree;
  frmCadastroTanque := nil;
end;{procedure}

procedure TfrmCadastroTanque.FormShow(Sender: TObject);
begin
  inherited;
  edtTipoCombustivel.Text := '';
  edtValorCombustivel.Text := '0,00';
  edtLitros.Text := '0,000';

  novo := false;
  Tanque := TTanques.Create;

  Tanque.AlimentaListaCombo(cmbApelidoTanque);
  cmbApelidoTanque.ItemIndex := 0;
  cmbApelidoTanqueSelect(Sender);
  cmbApelidoTanque.SetFocus;
end;{procedure}

end.
