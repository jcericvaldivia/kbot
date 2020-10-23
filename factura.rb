
class Factura
    
    def initialize(cantidad , precioUnitario)

       @cantidad = cantidad.to_i
       @precioUnitario =  precioUnitario.to_i
    end
    def calculoTotal()
        total = @cantidad * @precioUnitario
        "#{total}"
    end 


end

puts "Total : "

factura = Factura.new(ARGV[0],ARGV[1])


puts "Total : " + factura.calculoTotal()