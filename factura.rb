class MapaImpuestoEstado
    def initialize()

        @UT = 0.0685
        @NV = 0.08
        @TX = 0.0625
        @AL = 0.04
        @CA = 0.0825
        
        
     end

     def getUT()
        "#{@UT}"
     end
     def getNV()
        "#{@NV}"
     end
     def getTX()
        "#{@TX}"
     end
     def getAL()
        "#{@AL}"
     end
     def getCA()
        "#{@CA}"
     end


end

class Descuento
    def initialize()

        
        @rango1 = 0
        @rango2 = 3
        @rango3 = 5
        @rango4 = 7
        @rango5 = 10
        @rango6 = 15
        
        
     end

     def getDescuento(montoSubTotal)
        case montoSubTotal
        when 0..1000
            @rango1
        when 1001..5000
            @rango2
        when 5001..7000
            @rango3
        when 7001..10000
            @rango4
        when 10001..50000
            @rango5
        else
            @rango6
        
     end
    end
     


end

class Factura
    
    def initialize(cantidad , precioUnitario, estado)
       @mapImpuestoEstado = MapaImpuestoEstado.new()
       @cantidad = cantidad.to_i
       @precioUnitario =  precioUnitario.to_i
       @estado = estado
    end
    def calculoSubTotal()
       @subTotal = @cantidad * @precioUnitario
       "#{@subTotal}"
    end 
    def obtenerImpuestoEstado()
        @impuestoEstado = {"UT"=>  @mapImpuestoEstado.getUT(), "NV"=> @mapImpuestoEstado.getNV(), "TX"=> @mapImpuestoEstado.getTX(), "AL"=> @mapImpuestoEstado.getAL(), "CA"=> @mapImpuestoEstado.getCA()}[@estado]
        "#{@impuestoEstado}"
    end
    

    def calculoImpuesto()     
     
     @impuesto =  @subTotal *  @impuestoEstado.to_f
     
     "#{@impuesto}"
    end
    def obtenerDescuentoMonto()
        objDescuento = Descuento.new()
        @descuentoMonto= objDescuento.getDescuento(@subTotal + @impuesto)
    end
    def calculoDescuento()
        @descuento = (@subTotal + @impuesto) * ( @descuentoMonto*0.01)
        "#{@descuento}"
    end

    def calculoTotal()
      @total =  @subTotal+@impuesto - @descuento
      "#{@total}"
    end
    def getEstado()
        "#{@estado}"
    end
    def getImpuestoEstadoImpresion()
        obtenerImpuestoEstado()
       impuestoEstadoImpresion = @impuestoEstado
       
       "#{impuestoEstadoImpresion}"
    end
    def getDescuentoMonto()
        "#{@descuentoMonto}"   
    end


    



end


factura = Factura.new(ARGV[0],ARGV[1], ARGV[2])

puts "# #{ARGV[0]} * $#{ARGV[1]} = $" + factura.calculoSubTotal()

puts "#{factura.getEstado}(%#{factura.getImpuestoEstadoImpresion}) = $"+factura.calculoImpuesto()
factura.obtenerDescuentoMonto()
puts "DTO(%#{factura.getDescuentoMonto}) = $"+factura.calculoDescuento()
puts "Total = $"+factura.calculoTotal()