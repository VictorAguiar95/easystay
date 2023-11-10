require 'rails_helper'

describe 'Usuário vê detalhes de uma pousada' do
    it 'e vê informações adicionais' do
        Guesthouse.create!(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
                          address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', city: 'Ilha Comprida', 
                          state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', email: 'contato@icarai.com.br',
                          cnpj: '58.985.405/0001-06', quantity_rooms: 4)

        visit root_path
        click_on 'Pousada Icaraí'
        
        expect(page).to have_content('Pousada Icaraí')
        expect(page).to have_content('Endereço: Av. Beira Mar, 11380 - Balneário Icaraí, Ilha Comprida - SP, 11925-000')
        expect(page).to have_content('Numero de quartos: 4')
        expect(page).to have_content('Telefone: (13) 3842 1110')
        expect(page).to have_content('E-mail: contato@icarai.com.br')
    end
end