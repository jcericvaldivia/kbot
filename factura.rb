
class Factura
    
    def initialize(cantidad , precioUnitario)

       @cantidad = cantidad.to_i
       @precioUnitario =  precioUnitario.to_i
    end
    def calculoTotal()
        total = @cantidad * @precioUnitario
        "#{total}"
    end 
    def calculoImpuesto()
        @cantidad * @precioUnitario * 0.0825
    end


end


factura = Factura.new(ARGV[0],ARGV[1])

puts "# #{ARGV[0]} * $#{ARGV[1]} = $" + factura.calculoTotal()