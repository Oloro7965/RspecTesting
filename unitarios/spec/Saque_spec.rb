class ContaCorrente
    attr_accessor :saldo,:mensagem
    def initialize(valor)
        self.saldo=valor
    end
    def saca(saque)
        if (saque>saldo)
            self.mensagem='Saldo insuficiente para saque'
        elsif (saque>700.00)
            self.mensagem='limite máximo de saque é 700 reais'
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
        context 'saldo zero' do
            before(:all) do
                @conta=ContaCorrente.new(0.00)
                @conta.saca(100.00)
            end
            it 'saldo insuficiente' do
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque'
            end
            it 'checar saldo' do
                expect(@conta.saldo).to eql(0.00)
            end
        end
        context 'saldo insuficiente' do
            before(:all) do
                @conta=ContaCorrente.new(100.00)
                @conta.saca(101.00)
            end
            it 'saldo insuficiente' do
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque'
            end
            it 'checar saldo' do
                expect(@conta.saldo).to eql 100.00
            end
        end
        context 'limite por saque ultrapassado' do
            before(:all) do
                @conta=ContaCorrente.new(1000.00)
                @conta.saca(701.00)
            end
            it 'mensagem de limite de saque' do
                expect(@conta.mensagem).to eql 'limite máximo de saque é 700 reais'
            end
        end
        
    end
end
