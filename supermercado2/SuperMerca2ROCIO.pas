program SuperMerca2ROCIO;
uses crt;
type
  infoV= record
         fecha:string[9];
         tipo:string[25];
         cantV:integer;
         montoV:real;

  end;
  leerInfoV= record
         codProd: integer;
         fecha:string[10];
         tipo:string[25];
         cantV:integer;
         montoV:real;
  end;
  listaInfo=^nodo;
  nodo = record
         datos:infoV;
         sig:listaInfo;
  end;

   infoarbol= record
            codProd: integer;
            listaVporCod: listaInfo;
  end;

  arbolc=^nodo2;
  nodo2= record
         datos:infoarbol;
         HD: arbolC;
         HI: arbolC;
  end;

Procedure CrearListaAgregarAdelante (var L:listainfo; t:infoV);
Var nue:Listainfo;
Begin
     New(nue);
     nue^.datos:=t;
     nue^.sig:=L;
     L:=nue;
End;


procedure CargarRegistroArbol( var t: infoV; v:leerinfoV);
begin
  if(v.cantv <>-1) then begin
    t.cantV:=v.cantV;
    t.fecha:=v.fecha;
    t.tipo:=v.tipo;
    t.montoV:=v.montoV;
  end;

end;

procedure InsertarEnArbol(var a : arbolc ;var t:infoV; v:leerinfoV);
begin
  if (a = NIL) then begin
    new (a);
    a^.datos.codprod := v.codprod;
    CrearListaAgregarAdelante(a^.datos.listaVporCod,t);
    a^.HI := NIL;
    a^.HD := NIL;
  end
  else begin
     if(a^.datos.codprod > v.codprod) then
            InsertarEnArbol(a^.hI,t, v)
         else begin
            if(a^.datos.codprod < v.codprod) then
               InsertarEnArbol(a^.hD,t, v)
            else begin
               CargarRegistroArbol(t,v);
               CrearListaAgregarAdelante(a^.datos.listaVporCod,t);
            end;
         end;
      end;
  end;


procedure LeerInfoArbol( var v:leerinfoV);
begin
  writeln('Ingrese cantidad de unidades vendidas(-1 para finalizar): ');
  read(v.cantv);
  if(v.cantv <>-1) then begin
    writeln('Ingrese el codigo de producto');
    read(v.codProd);
    readln();
    Writeln('Ingrese la fecha de venta (dd/mm/aaaa): ');
    read(v.fecha);
    readln();
    Writeln('Ingrese el tipo de producto: ');
    read(v.tipo);
    read();
    Writeln('Ingrese el monto total de la venta: ');
    readln(v.montoV);
  end;

end;

procedure ArmarArbolDeBusqueda(var arb : arbolc );
var
  t:infoV;
  v:leerinfov;
begin
  LeerInfoArbol(v);
  while (v.cantv <> -1) do begin
          CargarRegistroArbol(t,v);
          InsertarEnArbol(arb,t,v);
          LeerInfoArbol(v);
  end;
end;

Procedure RecorridoAcotadoPorCodigo(var a: arbolc; inf: integer; sup: integer);
begin
     if(a <> nil) then begin
        if(a^.datos.codprod >= inf) then begin
           if(a^.datos.codprod <= sup) then begin
              writeln(a^.datos.listaVporcod^.datos.tipo);
              RecorridoAcotadoPorCodigo(a^.hI,inf,sup);
              RecorridoAcotadoPorCodigo(a^.hD,inf,sup);
           end
           else
              RecorridoAcotadoPorCodigo(a^.hI,inf,sup);
        end
        else
           RecorridoAcotadoPorCodigo(a^.hD,inf,sup);
     end;
    end;
  procedure RecorrerListayContar(l:listaInfo; var cantidad:integer);
   begin
      while(l <> nil) and(l^.datos.cantV<>-1) do begin
         if(l^.datos.montoV > 100) then
            cantidad:= cantidad + 1;
         l:= l^.sig;
      end;
   end;
procedure RecorridoPreOrdenContador(var a:arbolc; var cantidad:integer);
   begin
      if(a <> nil) then begin
         RecorrerListayContar(a^.datos.listaVporcod,cantidad);
         RecorridoPreOrdenContador(a^.hI,cantidad);
         RecorridoPreOrdenContador(a^.hD,cantidad);
      end;
   end;

procedure RecorrerLista(l:listainfo);
   begin
      while(l <> nil) do begin
         writeln(l^.datos.tipo);
         l:= l^.sig;
      end;
   end;
procedure RecorridoPreOrden(a:arbolc);
   begin
      if(a <> nil) then begin
         RecorrerLista(a^.datos.listaVporCod);
         RecorridoPreOrden(a^.hI);
         RecorridoPreOrden(a^.hD);
      end;
   end;



var
  arb:arbolc;
  inf,sup: integer;
  cantidad: integer;
begin
  arb:=nil;
  inf:=1500;
  sup:=2200;
  cantidad:= 0;
  textColor(30);
  ArmarArbolDeBusqueda(arb);
  writeln('Imprimiendo arbol con todos los datos...');
  RecorridoPreOrden(arb);
  writeln('Imprimiendo los tipos de productos de los codigos ', inf, ' a ', sup);
  RecorridoAcotadoPorCodigo(arb,inf,sup);
  RecorridoPreOrdenContador(arb,cantidad);
  writeln('La cantidad de ventas de un monto mayor a 100 son: ',cantidad);
  readln();
  readKey();
 end.
