program ArbolesTest;
uses crt;
type
  arbol = ^nodo;
  nodo = record
    hijoIzq : arbol;
    hijoDer : arbol;
    dato : integer;
    end;
procedure InsertarArbol(var a : arbol ; d : integer);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.dato := d;
    aux^.hijoIzq := NIL;
    aux^.hijoDer := NIL;
  end
  else
      if (d < a^.dato) then           // Si el dato es menor al dato en arbol
         InsertarArbol(a^.hijoIzq);   // lo inserta en el hijo izquierdo
      else (d > a^.dato)then          // si el dato es mayor al dato en arbol
         InsertarArbol(a^.hijoDer,d)  // lo inserta en el hijo derecho
end;

var
  arb : arbol;
begin
  arb := nil;
end.

