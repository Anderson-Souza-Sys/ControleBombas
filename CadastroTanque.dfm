inherited frmCadastroTanque: TfrmCadastroTanque
  Caption = 'Cadastro Tanque'
  OnShow = FormShow
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 16
    Top = 16
    Width = 109
    Height = 16
    Caption = 'Tanque (apelido)'
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 100
    Width = 108
    Height = 16
    Caption = 'Tipo Combust'#237'vel'
  end
  object Label3: TLabel [2]
    Left = 164
    Top = 100
    Width = 123
    Height = 16
    Caption = 'Pre'#231'o Combust'#237'vel '
  end
  object Label4: TLabel [3]
    Left = 316
    Top = 100
    Width = 108
    Height = 16
    Caption = 'Litros no Tanque'
  end
  inherited Panel1: TPanel
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
  object edtTipoCombustivel: TEdit
    Left = 16
    Top = 122
    Width = 135
    Height = 24
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 1
    Text = 'EDTTIPOCOMBUSTIVEL'
    OnExit = edtTipoCombustivelExit
  end
  object edtValorCombustivel: TEdit
    Left = 164
    Top = 122
    Width = 135
    Height = 24
    TabOrder = 2
    Text = 'edtValorCombustivel'
    OnExit = edtValorCombustivelExit
    OnKeyPress = edtValorCombustivelKeyPress
  end
  object cmbApelidoTanque: TComboBox
    Left = 16
    Top = 40
    Width = 435
    Height = 24
    TabOrder = 3
    Text = 'cmbApelidoTanque'
    OnSelect = cmbApelidoTanqueSelect
  end
  object edtLitros: TEdit
    Left = 316
    Top = 122
    Width = 135
    Height = 24
    Color = 16250871
    ReadOnly = True
    TabOrder = 4
    Text = 'edtLitros'
  end
end
