class ContaCorrente
    attr_accessor:saldo
    def initialize(valor)
        self.saldo=valor
    end
    def saca(saque)
        if (saque>saldo)
            return 'Saldo insuficiente para saque'
        else
            self.saldo-=saque
        end
    end 
end
describe ContaCorrente do
    describe 'saque' do
        context 'quando o valor é positivo' do
            before(:all) do
                @conta=ContaCorrente.new(1000.00)
                @conta.saca(200.00)
            end
            it 'atualiza saldo' do
                expect(@conta.saldo).to eql 800.00
            end
        end
        context 'saldo insuficiente' do
            before(:all) do
                @conta=ContaCorrente.new(0.00)
                #@conta.saca(100.00)
            end
            it 'saldo insuficiente' do
                expect(@conta.saca(100.00)).to eql('Saldo insuficiente para saquiades')
            end
            it 'checar saldo' do
                expect(@conta.saldo).to eql(0.00)
            end
        end
    end
end