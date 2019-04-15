program projectSuperMerca2;
uses crt;
type

    producto = record
          tipo : integer;
          desc : string;
          code : integer;
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
procedure GenerarLista(var L:lista);
var
  n,i,zaEndo: integer;
  p : producto;
begin
     randomize;
     zaEndo := 1;
     repeat
       write('Ingresar la cantidad deseada de elementos en la lista : ');
       readLn(zaEndo);
     until (zaEndo > 0);
     for i:= 1 to zaEndo do begin
       n := random(100);
       p.code:= n;
       p.desc:= 'Generico.';
       p.prec:= (n * 3.1415 + 15);
       p.tipo:= random(10);
       CrearListaAgregarAdelante (l,p);
     end;
     writeLn('Lista generada exitosamente.');
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

procedure RecorridoAcotado2(arb: arbol; inf: real; sup: real);
begin
 if (arb<>nil) then
    if (arb^.dato.prec >= inf) then
       if (arb^.dato.prec <=sup) then begin
         writeLn('Cod : ',arb^.dato.code,', Tipo : ',arb^.dato.tipo , 'Precio : ', arb^.dato.prec:4:2);
         RecorridoAcotado2(arb^.HI, inf, sup);
         RecorridoAcotado2(arb^.HD, inf, sup);
         end
         else RecorridoAcotado2 (arb^.HI, inf, sup)
    else
         RecorridoAcotado2 (arb^.HD, inf, sup);
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
  writeLn();
  ArmarArbolito(pri,arb);
  ImprimirPorNivel(arb);
  TextColor(26);
  writeLn('Imprimir acotado Por codigo desde 1500 hasta 2200 : ');
  RecorridoAcotado(arb,15,50);
  TextColor(27);
  writeLn('Imprimir acotado Por precio desde 50 a 100 : ');
  RecorridoAcotado2(arb,50,100);
  writeLn('Fin del programa, presiones cualquier tecla para finalizar.');
  readKey();
end.
