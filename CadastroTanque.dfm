inherited frmCadastroTanque: TfrmCadastroTanque
  Caption = 'Cadastro Tanque'
  OnShow = FormShow
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 16
    Top = 15
    Width = 127
    Height = 18
    Caption = 'Tanque (apelido)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 100
    Width = 128
    Height = 18
    Caption = 'Tipo Combust'#237'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 176
    Top = 100
    Width = 143
    Height = 18
    Caption = 'Pre'#231'o Combust'#237'vel '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 336
    Top = 100
    Width = 124
    Height = 18
    Caption = 'Litros no Tanque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    TabOrder = 4
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
  object edtTipoCombustivel: TEdit
    Left = 16
    Top = 122
    Width = 144
    Height = 26
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 1
    ParentFont = False
    TabOrder = 1
    Text = 'EDTTIPOCOMBUSTIVEL'
    OnExit = edtTipoCombustivelExit
  end
  object edtValorCombustivel: TEdit
    Left = 176
    Top = 122
    Width = 144
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = 'edtValorCombustivel'
    OnExit = edtValorCombustivelExit
    OnKeyPress = edtValorCombustivelKeyPress
  end
  object cmbApelidoTanque: TComboBox
    Left = 16
    Top = 40
    Width = 464
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'cmbApelidoTanque'
    OnSelect = cmbApelidoTanqueSelect
  end
  object edtLitros: TEdit
    Left = 336
    Top = 122
    Width = 144
    Height = 26
    Color = 16250871
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = 'edtLitros'
  end
end
