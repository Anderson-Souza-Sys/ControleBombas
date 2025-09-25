inherited frmRecargaTanque: TfrmRecargaTanque
  Caption = 'Recarga de Tanque'
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
    Top = 98
    Width = 108
    Height = 16
    Caption = 'Tipo Combust'#237'vel'
  end
  object lblTipoCombustivel: TLabel [2]
    Left = 16
    Top = 123
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
  object Label3: TLabel [3]
    Left = 184
    Top = 98
    Width = 108
    Height = 16
    Caption = 'Litros no Tanque'
  end
  object lblLitros: TLabel [4]
    Left = 184
    Top = 123
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
  object Label5: TLabel [5]
    Left = 16
    Top = 162
    Width = 91
    Height = 16
    Caption = 'Litros a incluir'
  end
  inherited Panel1: TPanel
    inherited btnNovo: TBitBtn
      Visible = False
    end
    inherited btnGravar: TBitBtn
      Width = 100
      Caption = '&Incluir Litros'
      ExplicitWidth = 100
    end
    inherited btnExcluir: TBitBtn
      Left = 210
      Visible = False
      ExplicitLeft = 210
    end
    inherited btnFechar: TBitBtn
      Left = 306
      ExplicitLeft = 306
    end
  end
  object cmbApelidoTanque: TComboBox
    Left = 16
    Top = 38
    Width = 318
    Height = 24
    TabOrder = 1
    Text = 'cmbApelidoTanque'
    OnSelect = cmbApelidoTanqueSelect
  end
  object edtLitrosIncluir: TEdit
    Left = 16
    Top = 192
    Width = 121
    Height = 24
    TabOrder = 2
    Text = '0,000'
    OnExit = edtLitrosIncluirExit
    OnKeyPress = edtLitrosIncluirKeyPress
  end
end
