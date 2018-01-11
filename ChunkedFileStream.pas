unit ChunkedFileStream;

interface

uses System.Classes, System.SysUtils;

type

	TChunkedFileStream = class(TFileStream)
	private
		ChunkStart, ChunkSize: Int64;
		procedure SetPosition(const Pos: Int64);
		function GetPosition: Int64;
	protected
		function GetSize(): Int64; override;
	public
		property Size: Int64 read GetSize;
		property Position: Int64 read GetPosition write SetPosition;
		constructor Create(const AFileName: string; Mode: Word; ChunkStart, ChunkSize: Int64);
		function Read(var Buffer; Count: Longint): Longint; overload; override;
		function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; reintroduce; overload;
	end;

implementation

{TChunkedFileStream}

constructor TChunkedFileStream.Create(const AFileName: string; Mode: Word; ChunkStart, ChunkSize: Int64);
begin
	self.ChunkStart := ChunkStart;
	self.ChunkSize := ChunkSize;

	inherited Create(AFileName, Mode);

end;

function TChunkedFileStream.GetSize: Int64;
begin
	result := ChunkSize;
end;

function TChunkedFileStream.Read(var Buffer; Count: Integer): Longint;
var
	filePosition: Int64;
	chunkEnd: Int64;
	readEnd: Int64;
begin
	filePosition := self.Position;
	chunkEnd := self.ChunkStart + self.ChunkSize;
	readEnd := filePosition + Count;

	if filePosition >= chunkEnd then //ушли за границу чанка
		exit(0);

	if readEnd > (chunkEnd) then //read till end;
	begin
		Count := chunkEnd - filePosition;
	end;
	if Count > self.ChunkSize then //пытаемся читать больше, чем положено
	begin
		Count := self.ChunkSize;
	end;

	result := inherited Read(Buffer, Count);
end;

function TChunkedFileStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
	result := FileSeek(FHandle, Offset + self.ChunkStart, Ord(Origin));
end;

function TChunkedFileStream.GetPosition: Int64;
begin
	result := self.Seek(0, soCurrent) - self.ChunkStart;
end;

procedure TChunkedFileStream.SetPosition(const Pos: Int64);
begin
	self.Seek(Pos, soBeginning);
end;

end.
