describe 'APP' do
   context 'Validando app para ler aquivo' do

      it "Não passando parametro" do
         console = ` ruby app.rb`
         expect(console).to eq("por favor passe os parametros exemplo --source data/users.csv\n")
      end

       it "Passando parametro" do
         console = ` ruby app.rb --source data/users.csv`
         expect(console).not_to eq("por favor passe os parametros exemplo --source data/users.csv\n")
      end

   end
end
