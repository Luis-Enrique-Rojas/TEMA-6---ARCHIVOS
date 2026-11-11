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
      f,f2:Text;  //Variable de acceso al Disco
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
var
  cad:string;
begin
  nom:='misdatos.txt';// 'd:/misarchivos/misdatos.txt'
  assign(f,nom);
  {$-I}
  reset(f); //ABRIR
  {$+I}
  if(IOResult<>0) then
  begin
    writeln('Error al ABRIR TXT . . .');
    exit;
    while(NOT eof(f))do
  begin
  readln(f,cad);
  end;
    close(f);
  end;
end;

procedure FTexto.copiar();
var
  cad:string;
begin
  //ARCHIVO ORIGINAL
  nom:='misdatos.txt'; //'d:
  assign(f,nom);
  {$-I}
  reset(f);    //ABRIR
  {$+I}
  if(IOResult<>0)then
  begin
    writeln('Error al ABRIR TXT . . .');
    exit;
  end;
  //CREAR EL NUEVO ARCHIVO COPIA
  nom:='miscopias.txt'; //'d
  assign(f2,nom);
  {$-I}
  rewrite(f2);          //CREAR
  {$+I}
  if(IOResult<>0)then
  begin
    writeln('Error al CREAR TXT . . .');
    exit;
  end;
  //REALIZAMOS LA OCPIA DE LOS DATOS
  while(NOT eof(f))do
  begin
  readln(f,cad);
  writeln(f2,cad);
  writeln('.');
  end;
  close(f);
  close(f2);
end;

end.

