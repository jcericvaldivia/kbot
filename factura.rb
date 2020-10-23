class MapaImpuestoEstado
    def initialize()

        @UT = 0.0685
        @NV = 0.08
        @TX = 0.0625
        @AL = 0.04
        @CA = 0.0685
        
        
     end

     def getUT
        "#{@UT}"
     end
     def getNV
        "#{@NV}"
     end
     def getTX
        "#{@TX}"
     end
     def getAL
        "#{@AL}"
     end
     def getCA
        "#{@CA}"
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
    def calculoImpuesto()
        hola={"es"=> 'Hola', "en"=> 'Hello'}[@idioma]
     @impuestoEstado = {"UT"=>  @mapImpuestoEstado.getUT, "NV"=> @mapImpuestoEstado.getNV, "TX"=> @mapImpuestoEstado.getTX, "AL"=> @mapImpuestoEstado.getAL, "CA"=> @mapImpuestoEstado.getCA}[@estado]   
     @impuesto = @cantidad * @precioUnitario * 0.0825
     "#{@impuesto}"
    end
    
    def calculoDescuento()
        @descuento = (@subTotal + @impuesto) * 0
        "#{@descuento}"
    end

    def calculoTotal()
      @total =  @subTotal+@impuesto
      "#{@total}"
    end
    def getEstado()
        "#{@estado}"
    end
    



end


factura = Factura.new(ARGV[0],ARGV[1], ARGV[2])

puts "# #{ARGV[0]} * $#{ARGV[1]} = $" + factura.calculoSubTotal()
puts "#{factura.getEstado}(%8.25) = $"+factura.calculoImpuesto()
puts "DTO(%0) = $"+factura.calculoDescuento()
puts "Total = $"+factura.calculoTotal()