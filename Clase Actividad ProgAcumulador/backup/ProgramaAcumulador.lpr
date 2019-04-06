program programaAcumulador;
uses CRT;
const
  DF = 2;
type
   consumo = record
     tipoConsumo : integer;
     fecha : String;
     monto : real;
   end;
   consumo2 = record
     tipoConsumo : integer;
     monto : real;
   end;
   lista = ^nodo;
   nodo = record
     datos : consumo;
     sig : lista;
   end;
   listaN = ^nodoN;
   nodoN = record
     datos : consumo2;
     sig : listaN;
   end;
   vectorListas = array[1..df] of lista;

procedure InicializarVector(var v : vectorListas);
var
  i : integer;
begin
   for i:= 1 to df do
       v[i] := nil;
end;
procedure AgregarAlFinal (var pri, ult: listaN; c: consumo2);
var
  nue : listaN;
begin
 new (nue);
 nue^.datos:= c;
 nue^.sig := NIL;
 if pri <> Nil then
                 ult^.sig := nue
               else
                 pri := nue;
 ult := nue;
end;
Procedure InsertarOrd ( var pri: lista; c : consumo);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := c;
  nue^.sig := nil;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.tipoConsumo < c.tipoConsumo) do begin
      ant := act;
      act := act^.sig;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
procedure CargarConsumo(var c: consumo);
begin
  c.tipoConsumo:= Random(6);
  c.fecha := '3/14/1592';
  write('Ingresar el monto del tipo ', c.tipoConsumo, ' : ');
  readLn(c.monto);
end;
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do
   begin
       writeLn ('tipo consumo : ',pri^.datos.tipoConsumo, ' Monto ' ,pri^.datos.monto:3:2) ;
       pri:= pri^.sig;
   end;
end;

Procedure CrearVectorListas ( var v: vectorListas);
var
    i,x : integer;
    c : consumo;
begin
   for i:=1 to 5 do
   begin
     x := random(df)+1;
     CargarConsumo(c);
     InsertarOrd(v[x],c);
   end;
End;
procedure minimo(var v:vectorListas;var monto : real ; var min : integer);
var
   i,cont :integer;
   posmin : integer;
begin
 min:=999;
 posmin := 1;
 monto := 0;
 for i:= 1 to df do
   begin
     if(v[i] <> nil) then
     begin
       if(v[i]^.datos.tipoConsumo <= min)then
       begin
         min := v[i]^.datos.tipoConsumo;
         posMin := i;
       end;
     end;
   end;
 if(v[posMin] <> nil)then
 begin
   monto := v[posmin]^.datos.monto;
   v[posMin] := v[posMin]^.sig;
 end;
end;

procedure Merge(var vector: vectorListas; var pri : listaN );
var
  act,min : integer;
  c2 : consumo2;
  ult : listaN;
  monto,tot : real;
begin
 pri:= nil;
 ult := nil;
 Minimo(vector,monto,min);
 while(min <> 999) do
   begin
     tot := 0;
     act := min;
     c2.tipoConsumo:= min;
     while ( (min = act) ) do
       begin
         tot := tot + monto;
         Minimo(vector,monto,min);
       end;
     C2.monto:= tot;
     AgregarAlFinal(pri,ult,c2);
     // minimo();
   end;
end;


procedure ImprimirVectorListas(Vec : vectorListas);
var
   i : integer;
begin
 TextColor(27);
 for i := 1 to DF do
   begin
            writeLn('Lista ', i );
            ImprimirLista(vec[i]);
   end;
 TextColor(26);
end;
Procedure ImprimirListaNueva ( pri : listaN);
Begin
 while (pri <> NIL) do begin
   delay(100);
   write(pri^.datos.tipoConsumo,' ') ;
   write(pri^.datos.monto:3:2);
   writeLn();
          pri:= pri^.sig;
 end;
 writeLn('se imprimio la lista');
end;
var
  vector : vectorListas;
  ln : listaN;
begin
  Randomize;
  ln := nil;
  TextColor(26);
  InicializarVector(vector);
  CrearVectorListas(vector);
  writeLn('Imprimiendo Vector de listas...');
  ImprimirVectorListas(vector);
  Merge(vector,ln);
  writeLn('Imprimiendo Lista Nueva ...');
  ImprimirListaNueva(ln);
  writeLn('Programa finalizado.');
  readKey();
end.

