program Actividad3;
uses crt;
Type
 lista = ^nodo;
 nodo = record
         datos: integer;
       	 sig: lista;
 end;
Procedure CrearListaAgregarAdelante (var L:lista; n:integer);
Var nue:Lista;
Begin
     New(nue);
     nue^.datos:=n;
     nue^.sig:=L;
     L:=nue;
End;
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
   write (pri^.datos ,' - ') ;
          pri:= pri^.sig
 end;
 writeLn('');
end;
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

procedure Musiquita ();
begin
 Sound(700);
 Delay(250);
 Sound(400);
 Delay(250);
 Sound(700);
 Delay(250);
 Sound(400);
 Delay(250);

 Sound(700);
 Delay(300);
 Sound(400);
 Delay(300);
 Sound(700);
 Delay(300);
 Sound(400);
 Delay(300);
 NoSound();
end;
var
  n:integer;
  l: lista;
  l1: lista;
  l2: lista;
  i:integer;
  ult: lista;
begin
  randomize;
  textcolor(26);
   l:=nil; l1:=nil; l2:=nil; ult:=nil;
  n := random(100);
  musiquita();
  for i:= 1 to 10 do begin
    CrearListaAgregarAdelante(l,n);
    CrearListaAgregarAtras(l1,ult,n);
    CrearListaOrdenada(l2,n);
    n := random(100);
  end;
  writeLn('lista agregar adelante');
  ImprimirLista(l);
  writeLn('lista agregar atras');
  ImprimirLista(l1);
  writeLn('lista ordenada');
  ImprimirLista(l2);

  readKey();
end.

