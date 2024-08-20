object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Serializa'#231#227'o e Desserializa'#231#227'o JSON'
  ClientHeight = 324
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Serializar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 159
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Desserializar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 64
    Width = 296
    Height = 249
    TabOrder = 2
  end
end
