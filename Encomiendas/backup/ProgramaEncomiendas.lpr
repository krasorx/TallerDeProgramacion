Program ProgramaEncomiendas;
uses crt;
{
 El imprimir por peso solo imprime un elemento del ultimo codigo
 La version anterior no cortaba los lazos anteriores de las listas,
 y aparecian varios codigos mas por cada peso de los que deberian,
 pero imprimia por codigo ord por peso
}
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

  arbol = ^nodo;
  nodo = record
    HI : arbol;
    HD : arbol;
    dato : Lista;
  end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure AgregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;
procedure InsertarArbol(var a : arbol ;le : lista);
var
   aux : arbol;
   ln : lista;
begin
  ln := nil;
  if (a = NIL) then begin
    ln := le;
    ln^.sig:= NIL;
    new (aux);
    aux^.dato := ln;        //le = listaEncomienda

    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (le^.dato.peso < a^.dato^.dato.peso) then         // Si el dato es menor al dato en arbol
         InsertarArbol(a^.HI,ln)       // lo inserta en el hijo izquierdo
      else if(le^.dato.peso > a^.dato^.dato.peso)then
         InsertarArbol(a^.HD,ln);  // lo inserta en el hijo derecho
  if(le^.dato.peso = a^.dato^.dato.peso)then
       begin
           AgregarAdelante(ln,ln^.dato);
           le := le^.sig;
       end;
end;
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux : lista;
begin
  aux := l;
  while (aux <> NIL) do begin
          InsertarArbol(arb,aux);
          aux:= aux^.sig;
  end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure ImprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;
Procedure ImprimirListaEnOrdenInverso (pri : lista);
Begin
 if (pri <> NIL) then begin
   ImprimirListaEnOrdenInverso(pri^.sig);
   if (pri <> NIL) then
            write('Codigo: ', pri^.dato.codigo, ' | ');
 end;
end;
Procedure PreOrden( a: arbol );
begin
  if( a <> nil) then
       begin
         write(a^.dato^.dato.codigo, ' ');
         preOrden(a^.HI);
         preOrden(a^.HD);
       end;
end;
procedure ImprimirPesosArbol(a : arbol);
begin
 if(a<> nil) then
 begin
   write('Encomiendas con Peso : ',a^.dato^.dato.peso , ' : ');
   ImprimirListaEnOrdenInverso(a^.dato);
   writeLn();
   ImprimirPesosArbol(a^.HI);
   ImprimirPesosArbol(a^.HD);
 end;
end;

Var

 l: lista;
 a : arbol;
begin
 Randomize;
 TextColor(30);
 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 writeLn(' ');
 TextColor(26);
 writeLn('Armando Arbolito...');
 ArmarArbolito(l,a);
 WriteLn('Precione cualquier tecla para Imprimir el arbol : ');
 readKey();
 ImprimirPesosArbol(a);
 TextColor(31);
 writeLn('Programa finalizado. Precione cualquier tecla para continuar...');
 readKey();
end.
