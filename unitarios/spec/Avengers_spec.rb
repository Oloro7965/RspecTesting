class Avengers
    attr_accessor:list
    def initialize
        self.list=[]
    end
    def put(avenger)
        self.list.push(avenger)
    end
end
describe Avengers do 
    it 'adicionar' do
        hq=Avengers.new
        hq.put('Spiderman')
        expect(hq.list).to eql ['Spiderman']

    end
    it 'adicionar elementos' do
        hq=Avengers.new
        hq.put('Teste1')
        hq.put('Teste2')
        hq.put('Teste3')
        
        res= hq.list.size > 0
        expect(res).to be true
        expect(hq.list).to include 'Teste3'
    end
    it 'Teste1 deve ser o primeiro da lista' do
        hq=Avengers.new
        hq.put('Teste1')
        hq.put('Teste2')
        hq.put('Teste3')
        expect(hq.list).to start_with('Teste1')
    end
end