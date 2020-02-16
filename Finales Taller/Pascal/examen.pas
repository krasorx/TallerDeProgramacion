program borrador;
type
	viaje = record
		numRemise: integer;
		codLoc: string;
		fecha: string;
		costo: real;
    end;

    arbol = ^nodoA;
    // El nodo del arbol deberia tener el codigo, numRemisse y cantV, no un registro(por eso me desaprobaron -.-")
    nodoA = record
        datos: viaje;
        cantV: integer;
        hi: arbol;
        hd: arbol;
    end;

    procedure leerViaje (var v:viaje);
    begin
        writeLn('Ingresar codigo de Localidad Destino: ');
        readln(v.codLoc);
        if (v.codLoc <> 'XXX') then
        begin
        writeLn('Ingresar Numero de Remisse: ');
        readln(v.numRemise);
        writeLn('Ingresar Fecha del viaje: ');
        readln(v.fecha);
        writeLn('Ingresar Costo del Viaje: ');
        readln(v.costo);
        end;
    end;

    procedure insertarOrdenado (var a:arbol;v:viaje);
    var
        nue:arbol;
    begin
        if (a = nil) then
        begin
            new(nue);
            nue^.datos:= v;
            nue^.hi:=nil;
            nue^.hd:=nil;
            nue^.cantV:=1;
            a:= nue;
        end
        else
            if (v.codLoc < a^.datos.codLoc)then
            begin
                insertarOrdenado(a^.hi,v);
            end
            else
                if(v.codLoc > a^.datos.codLoc) then
                begin
                    insertarOrdenado(a^.hd,v);
                end
                else
                    a^.cantV:= a^.cantV+1;
    end;

    procedure generarArbol (var a:arbol);
    var
        v:viaje;
    begin
        leerViaje(v);
        while (v.codLoc <> 'XXX') do
        begin
            insertarOrdenado(a,v);
            leerViaje(v);
        end;
    end;

    procedure calcularCantViajes(a:arbol;dest:string);
    begin
    // Habia que informar en el programa principal esto tambien...

        if (a <> nil)then
        begin
            if (dest < a^.datos.codLoc)then
                calcularCantViajes(a^.hi,dest)
            else
                if (dest > a^.datos.codLoc) then
                begin
                    calcularCantViajes(a^.hd,dest);
                end
                else
                    writeLn('La cantidad de viajes al destino: ',a^.datos.codLoc,' es: ',a^.cantV);
        end
        else
            writeLn('El Destino no existe!');
    end;

    procedure calcularInferiores (a:arbol;dest:string;var tot:integer);
    begin
        if (a <> nil) then
        begin
            writeLn('Ingresar localidad: ',a^.datos.codLoc);
            if (dest > a^.datos.codLoc)then
            begin
                tot:= tot + a^.cantV;
            calcularInferiores(a^.hi,dest,tot);
            calcularInferiores(a^.hd,dest,tot);
            end;
        end;
    end;
var
    a:arbol;
    dest:string;
    tot:integer;
begin
     a:= nil;
     tot:=0;
     generarArbol(a);
     writeln('Ingresar un codigo de destino a buscar: ');
     readln(dest);
     calcularCantViajes(a,dest);
     writeLn('Ingresar otro destino a calcular: ');
     readln(dest);
     calcularInferiores(a,dest,tot);
     writeLn('La cantidad de viajes a codigos inferiores al destino: ',dest,' es de : ',tot);
     readLn();
end.
