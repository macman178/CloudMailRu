program MailRuHash;

{$APPTYPE CONSOLE}
{$R *.res}

uses
	System.SysUtils, System.Hash, System.Classes;

var
	sha1: THashSHA1;
	buffer: array [0 .. 8191] of byte;
	read, f_length: LongInt;
	stream: TFileStream;
	initBuffer, finalBuffer: TBytes;
	Hash: string;

begin
	try
		stream := TFileStream.Create(ParamStr(1), fmOpenRead);
		Writeln(ParamStr(1));
		initBuffer := TEncoding.UTF8.GetBytes('mrCloud');

		sha1 := THashSHA1.Create;
		sha1.Update(initBuffer, length(initBuffer));
		f_length := 0;
		repeat
			read := stream.read(buffer, Sizeof(buffer));
			sha1.Update(buffer, read);
			f_length := f_length + read;
		until read < Sizeof(buffer);

		finalBuffer := TEncoding.UTF8.GetBytes(f_length.ToString);
		sha1.Update(finalBuffer, length(finalBuffer));
		Hash := sha1.HashAsString;
		Writeln(Hash);
		stream.Free;
	except
		on E: Exception do
			Writeln(E.ClassName, ': ', E.Message);
	end;
	Readln;

end.
