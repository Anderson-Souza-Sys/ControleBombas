object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stbPrincipal: TStatusBar
    Left = 0
    Top = 281
    Width = 635
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object Abastecimento1: TMenuItem
      Caption = 'Abastecimento'
      object Abastecer1: TMenuItem
        Caption = 'Abastecer'
        Hint = ' Abaste'#231'a com gasolina ou diesel '
        OnClick = Abastecer1Click
      end
    end
    object Bombas1: TMenuItem
      Caption = 'Bombas'
      object CadastrodeBombas1: TMenuItem
        Caption = 'Cadastro de Bombas'
        Hint = ' Cadastro, busca e exclus'#227'o de Bombas de combust'#237'vel '
        OnClick = CadastrodeBombas1Click
      end
    end
    object anque1: TMenuItem
      Caption = '&Tanque'
      object CadastroTanque1: TMenuItem
        Caption = '&Cadastro Tanque'
        Hint = ' Cadastro, busca e exclus'#227'o de tanque de combust'#237'vel'
        OnClick = CadastroTanque1Click
      end
      object RecargaTanque1: TMenuItem
        Caption = '&Recarga Tanque'
        Hint = 
          ' Carga nos tanques. Para fazer o abastecimento nas bombas primei' +
          'ro deve haver carga do tanque'
        OnClick = RecargaTanque1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelatrioderAbastecimento1: TMenuItem
        Caption = 'Relat'#243'rio der Abastecimento'
        Hint = ' Relat'#243'rio dos abastecimentos feito pelas bombas'
        OnClick = RelatrioderAbastecimento1Click
      end
      object RelatriodeRecargas1: TMenuItem
        Caption = 'Relat'#243'rio de Recargas'
        Hint = ' Relat'#243'rio de recargas nos tanques de combust'#237'veis'
        OnClick = RelatriodeRecargas1Click
      end
    end
  end
end
