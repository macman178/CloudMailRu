unit main;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Descriptions;

type
	TDescriptions = class(TForm)
		Keys: TListBox;
		Splitter1: TSplitter;
		dlgOpen: TOpenDialog;
		MainMenu1: TMainMenu;
		OpenItem: TMenuItem;
		SaveItem: TMenuItem;
		Panel1: TPanel;
		description: TMemo;
		Splitter2: TSplitter;
		Hex: TMemo;
		procedure OpenItemClick(Sender: TObject);
		procedure KeysClick(Sender: TObject);
	private
		ion: TDescription;
		{Private declarations}
	public
		{Public declarations}
		function StrToHex(str: WideString): WideString;
	end;

var
	Descriptions: TDescriptions;

implementation

{$R *.dfm}

procedure TDescriptions.KeysClick(Sender: TObject);
var
	t: WideString;
begin
	t := ion.GetValue(Keys.Items[Keys.ItemIndex]);
	description.text := t;
	Hex.text := StrToHex(t);
end;

procedure TDescriptions.OpenItemClick(Sender: TObject);
var
	ionKeys: TStrings;
begin
	if not(dlgOpen.Execute(self.Handle)) then exit;
	ionKeys := TStringList.Create;
	ion := TDescription.Create(dlgOpen.FileName);
	ion.Read;
	ion.GetItems(ionKeys);
	Keys.Items := ionKeys;
	ionKeys.Free;
end;

function TDescriptions.StrToHex(str: WideString): WideString;
var
	char: WideChar;
	o: Integer;
begin
	for char in str do
	begin
		o := ord(char);
		result := result + ' ' + IntToHex(o, 2);
	end;

end;

end.
