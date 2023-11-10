require 'rails_helper'

RSpec.describe Guesthouse, type: :model do
  describe '#valid?' do
		context 'presence' do
			it 'Invalidando campo nome comercial vazio' do
				guesthouse = Guesthouse.new(trade_name: '', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo razão social vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: '', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo endereço vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: '', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo bairro vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: '', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo cidade vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: '', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo estado vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: '', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo cep vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo telefone vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo e-mail vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: '', cnpj: '58.985.405/0001-06', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo cnpj vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '', quantity_rooms: 4)
				
				expect(guesthouse.valid?).to eq false
			end

			it 'Invalidando campo quartos vazio' do
				guesthouse = Guesthouse.new(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
											address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
											city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
											email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: '')
				
				expect(guesthouse.valid?).to eq false
			end
			#teste de pet faltando.
		end

		it 'Invalidando quando o cnpj ja esta em uso' do
			first_guesthouse = Guesthouse.create(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
												 address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', 
												 city: 'Ilha Comprida', state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', 
												 email: 'contato@icarai.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 4) 
			
			second_guesthouse = Guesthouse.new(trade_name: 'Pousada Aviação', corporate_name: 'Pousada Aviação LTDA', 
												address: 'Av. Pres. Kennedy, 3404', neighborhood: 'Aviação', 
												city: 'Praia Grande', state: 'SP', cep: '11702-480', phone_number: '(13) 3512-7239', 
												email: 'contato@aviacao.com.br', cnpj: '58.985.405/0001-06', quantity_rooms: 3) 
			
			result = second_guesthouse.valid?

			expect(result).to eq false
		end
	end
end
