program projectArbolesSupermercados2;
uses crt;
type

    producto = record
          tipo : integer;
          date : string;
          code : integer;
          cant : integer;
          prec : real;
  end;

 lista = ^nodo1;
 nodo1 = record
         datos : producto;
       	 sig: lista;
 end;

  arbol = ^nodo;
  nodo = record
    HI : arbol;
    HD : arbol;
    dato : producto;
  end;
    listaNivel = ^nodo2;
  nodo2 = record
    sig : listaNivel;
    info : arbol;
    end;
Procedure CrearListaAgregarAdelante (var L:lista; p:producto);
Var nue:Lista;
Begin
     New(nue);
     nue^.datos := p;
     nue^.sig:=L;
     L:=nue;
End;
procedure CargarDatos(var p : producto);
begin
     write('Ingresar la cantidad de productos de un tipo que se han vendido : ');
     readLn(p.cant);
     if(p.cant <> -1) then
     begin
       write('Codigo del producto : ');
       readLn(p.code);
       write('Tipo de producto : ');
       readLn(p.tipo);
       write('Precio del prodcuto : ');
       readLn(p.prec);
       //writeLn('Fecha de compra : ');
       //readLn(p.date);
       p.date := '15/04/2019';
     end;
end;
procedure InsertarArbolSinRepetir(var a : arbol ;var p : producto);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.dato := p;
    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (p.code < a^.dato.code) then         // Si el dato es menor al dato en arbol
         InsertarArbolSinRepetir(a^.HI,p)       // lo inserta en el hijo izquierdo
      else
         if (p.code > a^.dato.code) then        // si el dato es mayor al dato en arbol
         InsertarArbolSinRepetir(a^.HD,p);  // lo inserta en el hijo derecho
end;
procedure GenerarArbol(var a : arbol);
var
  n,i: integer;
  p : producto;
begin
     CargarDatos(p);
     while (p.cant <> -1) do
     begin
       InsertarArbolSinRepetir(a,p);
       CargarDatos(p);
     end;


     writeLn('Arbol generada exitosamente.');
end;
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux : lista;
begin
  aux := l;
  while (aux <> NIL) do begin
          InsertarArbolSinRepetir(arb,aux^.datos);
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
                    write (l^.info^.dato.code, ' - ');
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
   if (pri <> NIL) then write ('c : ',pri^.datos.code,', tipo : ',pri^.datos.tipo) ;
 end;
end;

procedure RecorridoAcotado(arb: arbol; inf: integer; sup: integer);
begin
 if (arb<>nil) then
    if (arb^.dato.code >= inf) then
       if (arb^.dato.code <=sup) then begin
         writeLn('Cod : ',arb^.dato.code,', Tipo : ',arb^.dato.tipo , 'Precio : ', arb^.dato.prec:4:2);
         recorridoAcotado(arb^.HI, inf, sup);
         recorridoAcotado(arb^.HD, inf, sup);
         end
         else recorridoAcotado (arb^.HI, inf, sup)
    else
         recorridoAcotado (arb^.HD, inf, sup);
 end;
function MontoVentas(monto : real; cantidad : integer) : REAL;
begin
  MontoVentas := monto * cantidad;
end;

procedure RecorridoAcotado2(arb: arbol; inf: real; sup: real);
begin
 if (arb<>nil) then
    if (arb^.dato.prec >= inf) then
       if (arb^.dato.prec <=sup) then begin
         if(MontoVentas(arb^.dato.prec,arb^.dato.cant) > 100) then
                                                       writeLn('Cod : ',arb^.dato.code,', Tipo : ',arb^.dato.tipo , 'Precio : ', MontoVentas(arb^.dato.prec,arb^.dato.cant));
         RecorridoAcotado2(arb^.HI, inf, sup);
         RecorridoAcotado2(arb^.HD, inf, sup);
         end
         else RecorridoAcotado2 (arb^.HI, inf, sup)
    else
         RecorridoAcotado2 (arb^.HD, inf, sup);
 end;
Procedure PreOrden( a: arbol );
begin
  if ( a <> nil )then begin
    if(MontoVentas(a^.dato.prec,a^.dato.cant) > 100) then
                                                  writeLn (a^.dato^.dato.codigo, ' precio : ', MontoVentas(a^.dato.prec,a^.dato.cant));
    preOrden (a^.HI);
    preOrden (a^.HD);
  end;
end;
var
  pri : lista;
  arb : arbol;
begin
  arb := NIL;
  pri := NIL;
  textColor(30);
  GenerarArbol(arb);
  writeLN('Lista en orden : ');
  ImprimirListaEnOrdenInverso(pri);
  writeLn();
  ArmarArbolito(pri,arb);
  ImprimirPorNivel(arb);
  TextColor(26);
  writeLn('Imprimir acotado Por codigo desde 15 hasta 50 : ');
  RecorridoAcotado(arb,15,50);
  TextColor(27);
  writeLn('Imprimir Codigos de productos con ventas mayor a 100 pesos : ');
  PreOrden(arb);
  writeLn('Fin del programa, presiones cualquier tecla para finalizar.');
  readKey();
end.
