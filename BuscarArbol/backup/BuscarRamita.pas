program BuscarRamita;
uses crt;
type
 lista = ^nodo1;
 nodo1 = record
         datos : integer;
       	 sig: lista;
 end;
  arbol = ^nodo;
  nodo = record
    HI : arbol;
    HD : arbol;
    dato : integer;
    end;
  Procedure CrearListaAgregarAdelante (var L:lista; NUM:integer);
Var nue:Lista;
Begin
     New(nue);
     nue^.datos:=num;
     nue^.sig:=L;
     L:=nue;
End;
procedure GenerarLista(var L:lista);
var
  n,i,ziEndo: integer;
begin
     ziEndo := 1;
     repeat
       write('Ingresar la cantidad deseada de elementos en la lista : ');
       readLn(ziEndo);
     until (ziEndo > 0);
     for i:= 1 to ziEndo do begin
       n := random(100);
       CrearListaAgregarAdelante(l,n);
       //CrearListaAgregarAdelante (l,n);
     end;
     writeLn('Lista generada exitosamente.');
end;
procedure InsertarArbol(var a : arbol ;var d : integer);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.dato := d;
    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (d <= a^.dato) then         // Si el dato es menor al dato en arbol
         InsertarArbol(a^.HI,d)       // lo inserta en el hijo izquierdo
      else                            // si el dato es mayor al dato en arbol
         InsertarArbol(a^.HD,d);  // lo inserta en el hijo derecho
end;
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux : lista;
begin
  aux := l;
  while (aux <> NIL) do begin
          InsertarArbol(arb,aux^.datos);
          aux:= aux^.sig;
  end;
end;
function BuscarRamita(arb : arbol; valor:integer):arbol;
begin
  if (arb <> nil) then
    if(arb^.dato = valor) then
       BuscarRamita:= arb
    else
        if (arb^.dato > valor) then
             BuscarRamita := BuscarRamita(arb^.HI, valor)
          else
             BuscarRamita := BuscarRamita(arb^.HD, valor)
  else
      BuscarRamita := nil;
end;
procedure BuscarMin(arb : arbol;var min : integer);
begin
  if (arb <> nil) then
    if(arb^.dato < min ) then begin
       min:= arb^.dato;
       buscarMin(arb^.HI,min);
    end
  else
     min := -1;
end;

Procedure ImprimirListaEnOrdenInverso ( pri : lista);
Begin
 if (pri <> NIL) then begin
   ImprimirListaEnOrdenInverso(pri^.sig);
   if (pri <> NIL) then write ('|',pri^.datos,'|') ;
 end;
end;
var
  pri : lista;
  arb,punteroAnodo : arbol;
  valor,min : integer;
begin
  randomize;
  arb := NIL;
  pri := NIL;
  min := MAXINT;
  textColor(28);
  GenerarLista(pri);
  writeLN('Lista en orden : ');
  ImprimirListaEnOrdenInverso(pri);
  writeLn();
  ArmarArbolito(pri,arb);
  write('Ingresar el valor a buscar : ');
  readLn(valor);
  if (BuscarRamita(arb,valor) <> nil) then writeLn('bien')
  else writeLn('Waldo no esta');
  BuscarMin(arb,min);
  writeLN(MIN);
  readKey();
end.
