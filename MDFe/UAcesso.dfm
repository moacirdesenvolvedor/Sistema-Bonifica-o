object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 186
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 45
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 64
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object editUsuario: TEdit
    Left = 110
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object editSenha: TEdit
    Left = 110
    Top = 64
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btAcesso: TButton
    Left = 80
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Acesso'
    ModalResult = 1
    TabOrder = 2
  end
  object btCancelar: TButton
    Left = 180
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
  end
  object ADOLogin: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 240
    Top = 136
  end
  object DSLogin: TADODataSet
    Connection = ADOLogin
    Parameters = <>
    Left = 200
    Top = 136
  end
  object QLogin: TADOQuery
    Connection = ADOLogin
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'nome'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'senha'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM GD_LOGIN'
      'WHERE LOG_NOME =:nome '
      'AND LOG_SENHA =:senha')
    Left = 160
    Top = 136
    object QLoginLOG_CODIGO: TIntegerField
      FieldName = 'LOG_CODIGO'
    end
    object QLoginLOG_NOME: TStringField
      FieldName = 'LOG_NOME'
      Size = 10
    end
    object QLoginLOG_SENHA: TStringField
      FieldName = 'LOG_SENHA'
      Size = 10
    end
    object QLoginLOG_ATIVO: TSmallintField
      FieldName = 'LOG_ATIVO'
    end
    object QLoginLOG_NIVEL: TIntegerField
      FieldName = 'LOG_NIVEL'
    end
    object QLoginLOG_DATA: TDateTimeField
      FieldName = 'LOG_DATA'
    end
    object QLoginLOG_ADM: TStringField
      FieldName = 'LOG_ADM'
      Size = 10
    end
    object QLoginLOG_TAB1: TIntegerField
      FieldName = 'LOG_TAB1'
    end
    object QLoginLOG_TAB2: TStringField
      FieldName = 'LOG_TAB2'
      Size = 50
    end
  end
  object SLogin: TDataSource
    DataSet = QLogin
    Left = 120
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 48
    Top = 120
    object NovoBancodeDados1: TMenuItem
      Caption = 'Novo Banco de Dados'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 80
  end
end
