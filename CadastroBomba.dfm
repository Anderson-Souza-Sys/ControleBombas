inherited frmCadastroBomba: TfrmCadastroBomba
  Caption = 'Cadastro de Bombas'
  OnShow = FormShow
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 19
    Top = 32
    Width = 123
    Height = 18
    Caption = 'Bomba (apelido)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 19
    Top = 106
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
    Left = 202
    Top = 106
    Width = 133
    Height = 18
    Caption = 'Litros dispon'#237'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTipoCombustivel: TLabel [3]
    Left = 19
    Top = 136
    Width = 118
    Height = 18
    Caption = 'lblTipoCombustivel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLitros: TLabel [4]
    Left = 202
    Top = 136
    Width = 46
    Height = 18
    Caption = 'lblLitros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
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
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 11
      Top = 24
      Width = 58
      Height = 18
      Caption = 'Tanque '
    end
    object cmbApelidoTanque: TComboBox
      Left = 11
      Top = 46
      Width = 318
      Height = 26
      TabOrder = 0
      Text = 'cmbApelidoTanque'
      OnSelect = cmbApelidoTanqueSelect
    end
  end
end
