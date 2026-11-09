unit uFTexto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { FTexto }

  FTexto=Class
    private
      nom:string;
      f:Text;  //Variable de acceso al Disco
    public
      procedure crear();
      procedure leer();
      procedure copiar();   //CTRL+SHIFT+C
  end;

implementation

{ FTexto }

procedure FTexto.crear();
begin
  nom:='misdatos.txt';   //'d
  assign(f,nom);
  {$-I}
  rewrite(f);
  {$+I}
  if(IOResult<>0)then
  begin
    writeln('Error al Crear TXT . . .');
    exit;
  end;
  writeln(f, '1124123');
  writeln(f, 'Juan Carlos Perez Peres');
  writeln(f, 'Ingenieria en Sistemas');
  close(f);
  writeln('Se creo el archivo TXT . . .');
end;

procedure FTexto.leer();
begin

end;

procedure FTexto.copiar();
begin

end;

end.

