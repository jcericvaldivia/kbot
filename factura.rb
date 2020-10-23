
class Factura
    
    def initialize(cantidad , precioUnitario)

       @cantidad = cantidad.to_i
       @precioUnitario =  precioUnitario.to_i
    end
    def calculoSubTotal()
       @subTotal = @cantidad * @precioUnitario
       "#{@subTotal}"
    end 
    def calculoImpuesto()
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


end


factura = Factura.new(ARGV[0],ARGV[1])

puts "# #{ARGV[0]} * $#{ARGV[1]} = $" + factura.calculoSubTotal()
puts "CA(%8.25) = $"+factura.calculoImpuesto()
puts "Total = $"+factura.calculoTotal()