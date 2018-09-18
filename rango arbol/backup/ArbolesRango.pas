program ArbolesRango;
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
    listaNivel = ^nodo2;
  nodo2 = record
    sig : listaNivel;
    info : arbol;
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
     randomize;
     ziEndo := 1;
     repeat
       write('Ingresar la cantidad deseada de elementos en la lista : ');
       readLn(ziEndo);
     until (ziEndo > 0);
     for i:= 1 to ziEndo do begin
       n := random(100);
       CrearListaAgregarAdelante (l,n);
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
      if (d < a^.dato) then         // Si el dato es menor al dato en arbol
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
{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
var c: integer;
begin
c:= 0;
While (l <> nil) do begin
 c:= c+1;
 l:= l^.sig;
End;
contarElementos := c;
end;
{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atras en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
var nue:listaNivel;

begin
new (nue);
nue^.info := a;
nue^.sig := nil;
if l= nil then l:= nue
         else ult^.sig:= nue;
ult:= nue;
end;
{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }

Procedure ImprimirPorNivel(a: arbol);
var
 l, aux, ult: listaNivel;
 nivel, cant, i: integer;
begin
 l:= nil;
 if(a <> nil)then begin
               nivel:= 0;
               agregarAtras (l,ult,a);
               while (l<> nil) do begin
                  nivel := nivel + 1;
                  cant:= contarElementos(l);
                  write ('Nivel ', nivel, ': ',' ':(15 - nivel));
                  for i:= 1 to cant do begin
                    write (l^.info^.dato, ' - ');
                    if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                    if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                    aux:= l;
                    l:= l^.sig;
                    dispose (aux);
                   end;
                   writeln;
               end;
             end;
end;
Procedure ImprimirListaEnOrdenInverso ( pri : lista);
Begin
 if (pri <> NIL) then begin
   ImprimirListaEnOrdenInverso(pri^.sig);
   if (pri <> NIL) then write ('|',pri^.datos,'|') ;
 end;
end;

procedure RecorridoAcotado(arb: arbol; inf: integer; sup: integer);
begin
 if (arb<>nil) then
    if (arb^.dato>= inf) then
       if (arb^.dato<=sup) then begin
         write(arb^.dato,'|');
         recorridoAcotado(arb^.HI, inf, sup);
         recorridoAcotado(arb^.HD, inf, sup);
         end
         else recorridoAcotado (arb^.HI, inf, sup)
    else recorridoAcotado (arb^.HD, inf, sup);



 end;






var
  pri : lista;
  arb : arbol;
begin
  arb := NIL;
  pri := NIL;
  textColor(30);
  GenerarLista(pri);
  writeLN('Lista en orden : ');
  ImprimirListaEnOrdenInverso(pri);
  //write('|',pri^.datos,'|');
  writeLn();
  ArmarArbolito(pri,arb);
//  writeLn(arb^.dato);
  ImprimirPorNivel(arb);
  writeLn('Ingrese el minimo del rango');
  read(inf);
  writeLn('Ingrese el maximo del rango');
  read(sup);

  RecorridoAcotado(arb,inf,sup);
  readKey();
end.

