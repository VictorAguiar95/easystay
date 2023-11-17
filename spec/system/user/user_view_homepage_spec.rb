require 'rails_helper'

describe 'Usuario visita tela inicial' do
    it 'e vê o nome da app' do
        
        visit(root_path)

        expect(page).to have_content('EasyStay')
        
    end

    it 'e vê pousadas cadastradas' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        Guesthouse.create(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
                          address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', city: 'Ilha Comprida', 
                          state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', email: 'contato@icarai.com.br',
                          cnpj: '58.985.405/0001-06', quantity_rooms: 4, user: user)
        second_user = User.create!(email: 'proprietario2@example.com', password: 'senha1234', role: 'proprietario')
        Guesthouse.create(trade_name: 'Pousada Aviação', corporate_name: 'Pousada Aviação LTDA', 
                          address: 'Av. Pres. Kennedy, 3404', neighborhood: 'Aviação', city: 'Praia Grande', 
                          state: 'SP', cep: '11702-480', phone_number: '(13) 3512-7239', email: 'contato@aviacao.com.br',
                          cnpj: '60.708.274/0001-61', quantity_rooms: 3, user:second_user)

        visit(root_path)

        expect(page).not_to have_content('Nenhuma pousada cadastrada.')
        expect(page).to have_content('Pousada Icaraí')
        expect(page).to have_content('Ilha Comprida')
        expect(page).to have_content('Pousada Aviação')
        expect(page).to have_content('Praia Grande')
    end

    it 'e não tem pousadas cadastradas' do
        
        visit(root_path)
        
        expect(page).to have_content('Nenhuma pousada cadastrada.')
    end
end