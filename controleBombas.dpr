program controleBombas;

uses
  Vcl.Forms,
  uBancoUtils in 'uBancoUtils.pas',
  uFuncoesGerais in 'uFuncoesGerais.pas',
  uConfiguracaoSistema in 'uConfiguracaoSistema.pas',  
  Principal in 'Principal.pas' {frmPrincipal},
  BaseInheritable in 'Inheritable Forms\BaseInheritable.pas' {frmbaseInheritable},
  CadastroInheritable in 'Inheritable Forms\CadastroInheritable.pas' {frmCadastroInheritable},
  ConfiguraBanco in 'ConfiguraBanco.pas' {frmConfiguraBanco},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  CadastroTanque in 'CadastroTanque.pas' {frmCadastroTanque},
  RecargaTanque in 'RecargaTanque.pas' {frmRecargaTanque},
  classBomba in 'classBomba.pas',
  CadastroBomba in 'CadastroBomba.pas' {frmCadastroBomba},
  classTanque in 'classTanque.pas',
  Abastecimento in 'Abastecimento.pas' {frmAbastecimento},
  classAbastecimento in 'classAbastecimento.pas',
  RelatorioAbastecimento in 'RelatorioAbastecimento.pas' {frmRelatorioAbastecimento},
  RelatorioRecarga in 'RelatorioRecarga.pas' {frmRelatorioRecarga},
  classRecarga in 'classRecarga.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle de Bombas';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
