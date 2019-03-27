program ProgramaMErge4Listas;
uses crt;
Const
  df=4;
Type
 Categorias=1..DF;
 libro=record
   ISBN: integer;
   end;

 lista = ^nodo;
 nodo = record
         datos: libro;
       	 sig: lista;
 end;
 vectorListas= array[1..df] of lista;

procedure InicializarVectorListas(var vector:vectorListas);
var
  i:integer;
begin
  for i := 1 to DF do
    vector[i] := nil;
end;
procedure AgregarAlFinal (var pri, ult: lista; lib: libro);
var  nue : lista;

begin
 new (nue);
 nue^.datos:= lib;
 nue^.sig := NIL;
 if pri <> Nil then
                 ult^.sig := nue
               else
                 pri := nue;
 ult := nue;
end;

Procedure CrearListaOrdenada ( var pri: lista; l : libro);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := l;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.ISBN < l.ISBN) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
procedure leerLibro (var l: libro; var c : categorias);
begin
  l.ISBN := Random(11);
  c := Random(5);
end;
procedure CargarVector(var v : vectorListas);
var
   l : libro;
   i,j : integer;
   c : categorias;
begin

  for i := 1 to 20 do
    begin
          LeerLibro(l,c);
          CrearListaOrdenada( v[c] , l);
    end;
end;
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   write ( ' | ', pri^.datos.ISBN , ' | ' ) ;
          pri:= pri^.sig
 end;
 writeLn();
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
end;
procedure minimo(var v:vectorListas; var l:lista);
var
   min , i :integer;
   posmin : integer;
begin
 min:=maxInt;
 posmin := 1;
 l := nil;
 for i:= 1 to df do begin
     if(v[i]<>nil) then begin
        if (v[i]^.datos.ISBN < min) then begin
            min:= v[i]^.datos.ISBN;
            posMin := i;
        end;
     end;
 end;
 if(v[posMin] <> nil) then
    begin
        l := v[posmin];
        v[posMin]:=v[posMin]^.sig;
    end;
end;

procedure merge(var vector: vectorListas; var pri : lista );
var
   Plibro : lista;
   ult : lista;
begin
 Plibro := nil;
 ult := nil;
 minimo(vector,Plibro);
 while(Plibro<>nil)do begin
          AgregarAlFinal(pri,ult,Plibro^.datos);
          minimo(vector,Plibro);
 end;

end;

/////////////////////////////
var
  vector:vectorListas;
  i : integer;
  l: lista;
begin
  l := nil;
  Randomize;
  TextColor(26);
  InicializarVectorListas(vector);
  CargarVector(vector);
  ImprimirVectorListas(vector);
  TextColor(26);
  Merge(vector,l);
  WriteLn('Lista Mergiada');
  ImprimirLista(l);

  readKey();

end.

