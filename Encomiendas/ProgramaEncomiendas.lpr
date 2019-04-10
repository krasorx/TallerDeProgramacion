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
procedure InsertarArbol(var a : arbol ;e : encomienda;var ln : lista);        //Habria que pasarle una encomienda y crear una lista
var
   aux : arbol;
   //ln : lista;
begin
  if (a = NIL) then begin
    ln := nil;
    AgregarAdelante(ln,e);
    new (aux);
    aux^.dato := ln;

    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (e.peso < a^.dato^.dato.peso) then begin

         InsertarArbol(a^.HI,e,ln);

      end
      else if(e.peso > a^.dato^.dato.peso)then    begin

         InsertarArbol(a^.HD,e,ln);

      end;
  if(e.peso = a^.dato^.dato.peso)then
       begin
           AgregarAdelante(a^.dato,e);
       end;
end;
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux,ln : lista;
begin
  aux := l;
  ln := nil;
  while (aux <> NIL) do begin
          InsertarArbol(arb,aux^.dato,ln);
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
