//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON, REST.JSON;

type

  TPerson = class
  private
    FName: string;
    FAge: Integer;
  public
    property Name: string read FName write FName;
    property Age: Integer read FAge write FAge;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    JsonString: string;

    procedure SerializeToJson;
    procedure DeserializeFromJson;
    function UnicodeToUTF8(const AText: string): string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SerializeToJson;
end;


procedure TForm1.SerializeToJson;
var
  Person: TPerson;

begin

  Person := TPerson.Create;
  try
    Person.Name := 'João';
    Person.Age := 30;

    // Serializando o objeto para JSON
    JsonString := UnicodeToUTF8(TJson.ObjectToJsonString(Person));

    Memo1.Lines.Add(JsonString);  // {"Name":"João","Age":30}
  finally
    Person.Free;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DeserializeFromJson;
end;

procedure TForm1.DeserializeFromJson;
var
  Person: TPerson;

begin
  // Desserializando o JSON para um objeto Delphi
  Person := TJson.JsonToObject<TPerson>(JsonString);
  try
    Memo1.Lines.Add('Name: ' + Person.Name);  // João
    Memo1.Lines.Add('Age: ' + IntToStr(Person.Age));  // 30
  finally
    Person.Free;
  end;
end;


function TForm1.UnicodeToUTF8(const AText: string): string;
var
  I: Integer;
  Code: Integer;
  UnicodeStr: string;
  UnicodeChar: WideChar;

begin
  //Essa função é necessária para converter caracteres do tipo unicode, com acentos

  Result := '';
  I := 1;
  while I <= Length(AText) do
  begin
    if (AText[I] = '\') and ((I + 5) <= Length(AText)) and (AText[I + 1] = 'u') then
    begin
      // Captura o código Unicode (4 dígitos hexadecimais)
      UnicodeStr := '$' + Copy(AText, I + 2, 4);
      if TryStrToInt(UnicodeStr, Code) then
      begin
        UnicodeChar := WideChar(Code);
        Result := Result + UnicodeChar;
      end;
      Inc(I, 6); // Avança para a próxima sequência
    end
    else
    begin
      Result := Result + AText[I];
      Inc(I);
    end;
  end;

end;

end.
