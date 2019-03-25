program progListas;
uses crt;
Const
  df=4;
Type
 Categorias=1..4;
 anyos=1980..2018;
 empleado=record
   categoria: categorias;
   codigo: integer;
   apellido: string;
   Anyoingreso: anyos;

   end;



 lista = ^nodo;
 nodo = record
         datos: empleado;
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


Procedure CrearListaOrdenada ( var pri: lista; emp: empleado);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := emp;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.apellido < emp.apellido) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
procedure leerEmpleado (var e: empleado);
begin
  with e do begin
      write('Categoria');
      readln(categoria);
      write('codigo');
      readln(codigo);
      write('apellido');
      readln(apellido);
      write('anyo');
      readln(anyoIngreso);
  end;
end;
procedure CargarVector(var v : vectorListas);
var
   e: empleado;
   i : integer;
begin

  for i := 1 to 2 do
    begin

        LeerEmpleado(e);
        CrearListaOrdenada( v[e.categoria] , e);;

    end;
end;
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   writeLn (pri^.datos.apellido) ;
          pri:= pri^.sig
 end;
end;

/////////////////////////////
var
  vector:vectorListas;
  i : integer;
  l: lista;


begin

  InicializarVectorListas(vector);
  CargarVector(vector);

  for i := 1 to DF do
    begin

         ImprimirLista( vector[i]);

    end;

  readKey();

end.

