program EliminarHoja;
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
       //n := random(100);
             readln(n);
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
    if(arb^.dato <= min ) then begin
       min:= arb^.dato;
       buscarMin(arb^.HI,min);
    end
  else
     min := -1;
end;
procedure DeleteThis(var a : arbol; v:integer; var loEncontro : boolean; var ant:arbol);
var
  min : integer;
begin
  min := 999;
  if(a = nil)then
    loEncontro := false
  else
     begin
        if (a^.dato > v)then
          DeleteThis(a^.HI,v,loEncontro,a)
          else
             if (a^.dato < v)then
               DeleteThis(a^.HD,v,loEncontro,a)
               else  begin
                  loEncontro := true;
                  if( (a^.HI = NIL) AND (a^.HD <> NIL) )then begin
                    loEncontro := true;
                    a := a^.HD;
                    dispose(ant);
                    end
                    else
                       if( (a^.HD = NIL) AND (a^.HI <> NIL) ) then   begin
                         loEncontro := true;
                         a := a^.HI;
                         Dispose(ant);
                         end
                         else
                            if ( (a^.HD <> NIL) AND (a^.HI <> NIL) )then     //funca
                              begin
                                 loEncontro := true;
                                 BuscarMin(a^.HD, min);
                                 a^.dato:= min;
                                 DeleteThis(a^.HD,min,loEncontro,a);
                                 Dispose(ant);
                              end
                         else
                             if( (a^.HD = NIL) AND (a^.HI = NIL) )then
                               begin
                                  loEncontro := true;
                                  Dispose(ant);
                                  a^.HI := nil;
                                  a^.HD:= nil;

                               end;
               end;
     end;
end;
Procedure PreOrden( a: arbol );
begin
  if( a <> nil) then
       begin
         write(a^.dato, ' | ');
         preOrden(a^.HI);
         preOrden(a^.HD);
       end;
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
  arb,ant,punteroAnodo : arbol;
  valor,min : integer;
  loEncontro : boolean;
begin
  randomize;
  arb := NIL;
  ant := NIL;
  pri := NIL;
  loEncontro := true;
  min := MAXINT;
  textColor(28);
  GenerarLista(pri);
  writeLN('Lista en orden : ');
  ImprimirListaEnOrdenInverso(pri);
  writeLn();
  ArmarArbolito(pri,arb);
  write('Ingresar el valor a eliminar : ');
  readLn(valor);
  DeleteThis(arb,valor,loEncontro,ant);
  if (loEncontro)then
    writeLn(' Eliminado ')
    else
       writeLn(' Mejor suerte la proxima salu2 ');
  TextColor(26);
  preOrden(arb);
  readKey();
end.
