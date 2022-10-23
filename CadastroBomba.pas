unit CadastroBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroInheritable, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Vcl.Grids, Vcl.DBGrids, classBomba, classTanque;

type
  TfrmCadastroBomba = class(TfrmCadastroInheritable)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbApelidoBomba: TComboBox;
    GroupBox1: TGroupBox;
    cmbApelidoTanque: TComboBox;
    Label4: TLabel;
    lblTipoCombustivel: TLabel;
    lblLitros: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure cmbApelidoBombaSelect(Sender: TObject);
    procedure cmbApelidoTanqueSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBomba: TfrmCadastroBomba;
  Bomba : TBombas;
  Tanque : TTanques;
  novo : boolean;

implementation

{$R *.dfm}

uses uDmPrincipal, uGlobal;

procedure TfrmCadastroBomba.btnExcluirClick(Sender: TObject);
begin
  inherited;
  If Pergunta('Deseja excluir este cadastro?') then
    If not Bomba.Excluir Then
      Erro(Bomba.Mensagem);{if/if}

  Bomba.AlimentaListaCombo(cmbApelidoBomba);
  cmbApelidoBomba.ItemIndex := 0;
  cmbApelidoBombaSelect(Sender);
end;

procedure TfrmCadastroBomba.btnGravarClick(Sender: TObject);
begin
  inherited;

  If Bomba.Campos.ID_Tanque < 1 Then
  Begin
    Alerta('A Bomba deve estar vinculada a um Tanque');
    Abort;
  End;{if}

  If not Pergunta('Deseja gravar este cadastro da Bomba?') then
    Abort;{if}

  Bomba.Campos.Apelido_Bomba := cmbApelidoBomba.Text;

  If novo then
  Begin
    if not Bomba.Cadastrar then
      Erro(Bomba.Mensagem);{if}
  End Else
    if not Bomba.Atualizar then
      Erro(Bomba.Mensagem);{if/if}

  novo := False;
  Bomba.AlimentaListaCombo(cmbApelidoBomba);
  cmbApelidoBomba.ItemIndex := 0;
  cmbApelidoBombaSelect(Sender);
end;{procedure}

procedure TfrmCadastroBomba.btnNovoClick(Sender: TObject);
begin
  inherited;
  novo := True;
  lblTipoCombustivel.Caption := '';
  lblLitros.Caption := '0,000';
  cmbApelidoBomba.SetFocus;
end;{procedure}

procedure TfrmCadastroBomba.cmbApelidoBombaSelect(Sender: TObject);
begin
  inherited;
  if not novo then
  Begin
    if not Bomba.Localizar(cmbApelidoBomba.Text) Then
      Erro(Bomba.Mensagem);{if}

    cmbApelidoBomba.Text := Bomba.Campos.Apelido_Bomba;
    cmbApelidoTanque.Text := Bomba.Atributos.Apelido_Tanque;
    lblTipoCombustivel.Caption := Bomba.Atributos.Tipo_Combustivel;
    lblLitros.Caption := FloatToStrF(Bomba.Atributos.Litros, ffNumber, 10, 3);
  End;{if}
end;{procedure}

procedure TfrmCadastroBomba.cmbApelidoTanqueSelect(Sender: TObject);
begin
  inherited;
  if not Tanque.Localizar(cmbApelidoTanque.Text) Then
    Erro(Tanque.Mensagem);{if}

  Bomba.Campos.ID_Tanque := Tanque.Campos.ID_Tanque;
  lblTipoCombustivel.Caption := Tanque.Campos.Tipo_Combustivel;
  lblLitros.Caption := FloatToStrF(Tanque.Campos.Litros, ffNumber, 10, 3);
end;{procedure}

procedure TfrmCadastroBomba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Bomba.Destroy;
  Tanque.Destroy;

  Action := caFree;
  frmCadastroBomba := nil;
end;{procedure}

procedure TfrmCadastroBomba.FormShow(Sender: TObject);
begin
  inherited;
  novo := false;
  Bomba := TBombas.Create;
  Bomba.AlimentaListaCombo(cmbApelidoBomba);
  Tanque := TTanques.Create;
  Tanque.AlimentaListaCombo(cmbApelidoTanque);

  cmbApelidoBomba.ItemIndex := 0;
  cmbApelidoBombaSelect(Sender);
  cmbApelidoBomba.SetFocus;
end;{procedure}

end.
