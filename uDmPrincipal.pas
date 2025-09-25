unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client,
  Data.DB, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmPrincipal = class(TDataModule)
    FDC: TFDConnection;
    FDT: TFDTransaction;
    qryID_Tanque: TFDQuery;
    qryID_Bomba: TFDQuery;
    qryTanque: TFDQuery;
    qryDataHora: TFDQuery;
    updTanque: TFDQuery;
    delTanque: TFDQuery;
    qryBombas: TFDQuery;
    updBomba: TFDQuery;
    delBomba: TFDQuery;
    qryGenerica: TFDQuery;
    tbAbastecimento: TFDTable;
    updLitros: TFDQuery;
    qryBomba: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
