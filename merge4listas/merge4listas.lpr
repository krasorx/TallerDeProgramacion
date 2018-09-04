program merge4listas;
const
  dimF= 4;
type
    libro = record
      ISBM : integer;
    end;
    lista = ^nodo;
    nodo = record
         datos : libro;
         sig : lista;
  end;
    vectorBiblio= array[1..dimF] of lista;

procedure InicializarVector(var v : vectorBiblio);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := nil;
end;
procedure EliminarLibro(var l:lista);
var
   p : lista;
begin
 new(p);
 p := l;
 l := p^.sig;
 Dispose(p);
end;
Procedure CrearListaOrdenada ( var pri: lista; l : libro);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := l;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.ISBM < l.ISBM) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

Procedure AgregarAlFinal(var p, Ult: lista; var l:libro );
Var
nue : lista;

begin
 new (nue);
 nue^.datos:= l;
 nue^.sig := NIL;
 if p <> Nil then
    ult^.sig := nue
 else
     p := nue;
 ult := nue;

 //EliminarLibro(p);
end;
procedure CargarLibros(var l:libro);
begin
 Randomize;
 l.ISBM:= random(50);
end;

Procedure CrearVector4Listas (var v:vectorBiblio);
var
   l : libro;
   n,i,j : integer;
begin
 for i := 1 to dimF do
     begin
       writeLn('Cuantos libros en la estanteria ', i,'?');
       readln(n);
       for j:=1 to n do
          begin
           CargarLibros(l);
           CrearListaOrdenada(v[i],l);
          end;
     end;
end;

procedure DeterminarMinimo(var v: vectorBiblio; var book:libro; var posmin:integer);
var
min, i: integer;
Begin
 min:=MAXINT;
 posmin := 999;
 for i:= 1 to dimF do
    begin
       if v[i] <> nil then begin
         if(v[i]^.datos.ISBM < min) then begin
                  min:= V[i]^.datos.ISBM ;
                  posMin:= i;
         end;
       end;
    end;
 if (posmin <> 999) then
    book := v[posmin]^.datos;
 if (v[posmin] <> nil) then
    v[posmin] := v[posmin]^.sig;
end;
procedure Merge4(var v : vectorBiblio; var ln : lista );
var
   aux : lista;
   posmin : integer;
   book : libro;
   condicion : boolean;
begin
 DeterminarMinimo(v,book,posmin);
 while(posmin <> 999) do begin

   AgregarAlFinal(ln,aux, book );
   DeterminarMinimo(v,book,posmin);
 end;
end;

Procedure ImprimirLista ( pri : lista);

Begin
 while (pri <> NIL) do begin
   writeLn(pri^.datos.ISBM) ;
          pri:= pri^.sig;
 end;
end;

var
  vBiblio : vectorBiblio;
  listaNueva : lista;
begin
  listaNueva := NIL;
  InicializarVector(vBiblio);
  CrearVector4Listas(vBiblio);
  Merge4(vBiblio, listaNueva);
  ImprimirLista(ListaNueva);
  readLn();
end.
