program description;

uses
  Vcl.Forms,
  main in 'main.pas' {Descriptions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDescriptions, Descriptions);
  Application.Run;
end.
