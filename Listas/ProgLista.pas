program ProgramaLista;
Type  
 lista = ^nodo;
 nodo = record
         datos: integer;
       	 sig: lista;
 end;
Procedure CrearListaAgregarAdelante (var L:lista; per:integer);
Var nue:Lista;
Begin
     New(nue);
     nue^.datos:=per;
     nue^.sig:=L;
     L:=nue;
End;
Procedure CrearListaOrdenada ( var pri: lista; per: integer);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := per;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos < per) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

Procedure CrearListaAgregarAtras(var L, Ult: lista; per:integer);
Var
nue : lista;

begin 
 new (nue);
 nue^.datos:= per;
 nue^.sig := NIL;
 if l <> Nil then
    ult^.sig := nue
 else
     l := nue;
 ult := nue;
end;

Procedure ImprimirLista ( pri : lista);

Begin
 while (pri <> NIL) do begin
   write (pri^.datos) ;
          pri:= pri^.sig
 end;
end;

var
num : INTEGER;
l1,l2,l3,ult : lista;

Begin {prog. ppal}
  Randomize;
  writeLn('Ingresar un numero entero : ');
  num := Random(11);
  L1:=nil;
  L2:=nil;
  L3:=nil;
  While (num  <> 0) do Begin
       CrearListaAgregarAdelante (L1, num);
       CrearListaAgregarAtras(L2,ult,num);
       CrearListaOrdenada(L3,num);
       writeLn('Ingresar un numero entero : ');
       num := Random(10);
       writeLn('Lista Agregar Adelante : ');
       ImprimirLista(L1);
       writeLn('Lista Agregar Atras : ');
       ImprimirLista(L2);
       writeLn('Lista OrdenanadX : ');
       ImprimirLista(L3);
  End;
  readLn();
end.

