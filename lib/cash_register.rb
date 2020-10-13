

class CashRegister 
    attr_accessor :total, :discount
    attr_reader :items
    def initialize (discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @last_item = {}
    end

    def add_item (title, price, quantity=1)
        (1..quantity).each { @items << title }
        @last_item = {:title => title, :price=> price, :quantity=> quantity}
        # (1..quantity).each { @items << {:title => title, :price=> price, :quantity=> quantity} }
        @total += price * quantity
    end

    def apply_discount
        
        if @discount == nil 
             "There is no discount to apply." 
        else
            @total -= @total * discount / 100
             "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @total -= @last_item[:price] * @last_item[:quantity]
    end

    
end
