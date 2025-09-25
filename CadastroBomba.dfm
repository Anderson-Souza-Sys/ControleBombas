inherited frmCadastroBomba: TfrmCadastroBomba
  Caption = 'Cadastro de Bombas'
  OnShow = FormShow
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 19
    Top = 32
    Width = 105
    Height = 16
    Caption = 'Bomba (apelido)'
  end
  object Label2: TLabel [1]
    Left = 19
    Top = 106
    Width = 108
    Height = 16
    Caption = 'Tipo Combust'#237'vel'
  end
  object Label3: TLabel [2]
    Left = 202
    Top = 106
    Width = 112
    Height = 16
    Caption = 'Litros dispon'#237'veis'
  end
  object lblTipoCombustivel: TLabel [3]
    Left = 19
    Top = 136
    Width = 107
    Height = 16
    Caption = 'lblTipoCombustivel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLitros: TLabel [4]
    Left = 202
    Top = 136
    Width = 44
    Height = 16
    Caption = 'lblLitros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
  object cmbApelidoBomba: TComboBox
    Left = 19
    Top = 54
    Width = 318
    Height = 24
    TabOrder = 1
    Text = 'cmbApelidoBomba'
    OnSelect = cmbApelidoBombaSelect
  end
  object GroupBox1: TGroupBox
    Left = 343
    Top = 8
    Width = 341
    Height = 81
    Caption = ' V'#237'nculo  '
    TabOrder = 2
    object Label4: TLabel
      Left = 11
      Top = 24
      Width = 51
      Height = 16
      Caption = 'Tanque '
    end
    object cmbApelidoTanque: TComboBox
      Left = 11
      Top = 46
      Width = 318
      Height = 24
      TabOrder = 0
      Text = 'cmbApelidoTanque'
      OnSelect = cmbApelidoTanqueSelect
    end
  end
end
