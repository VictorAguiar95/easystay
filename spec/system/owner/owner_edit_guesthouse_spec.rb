require 'rails_helper'

describe 'Proprietario edita uma pousada' do
    it 'a partir da pagina de detalhes' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        guesthouse = Guesthouse.create!(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
                    address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', city: 'Ilha Comprida', 
                    state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', email: 'contato@icarai.com.br',
                    cnpj: '58.985.405/0001-06', quantity_rooms: 4, user: user)

        visit root_path
        login_as(user, scope: :user)
        click_on 'Pousada Icaraí'
        click_on 'Editar'

        expect(page).to have_content 'Editar Pousada'
        expect(page).to have_field('Nome Comercial', with: 'Pousada Icaraí')
        expect(page).to have_field('Razão Social', with: 'Pousada Icaraí LTDA')
        expect(page).to have_field('Endereço', with: 'Av. Beira Mar, 11380')
        expect(page).to have_field('Bairro', with: 'Balneário Icaraí')
        expect(page).to have_field('Cidade', with: 'Ilha Comprida')
        expect(page).to have_field('Estado', with: 'SP')
        expect(page).to have_field('CEP', with: '11925-000')
        expect(page).to have_field('Telefone', with: '(13) 3842 1110')
        expect(page).to have_field('E-mail', with: 'contato@icarai.com.br')
        expect(page).to have_field('CNPJ', with: '58.985.405/0001-06')
        expect(page).to have_field('Quantidade de quartos', with: 4)
    end

    it 'com sucesso' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        guesthouse = Guesthouse.create!(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
                    address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', city: 'Ilha Comprida', 
                    state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', email: 'contato@icarai.com.br',
                    cnpj: '58.985.405/0001-06', quantity_rooms: 4, user: user)

        visit root_path
        login_as(user, scope: :user)
        click_on 'Pousada Icaraí'
        click_on 'Editar'
        fill_in 'Nome Comercial', with: 'Pousada Aviação'
        fill_in 'Razão Social', with: 'Pousada Aviação LTDA'
        fill_in 'Endereço', with: 'Av. Pres. Kennedy, 3404'
        fill_in 'Bairro', with: 'Aviação'
        fill_in 'Cidade', with: 'Praia Grande'
        fill_in 'Estado', with: 'SP'
        fill_in 'CEP', with: '11702-480'
        fill_in 'Telefone', with: '(13) 3512-7239'
        fill_in 'E-mail', with: 'contato@aviacao.com.br'
        fill_in 'CNPJ', with: '60.708.274/0001-61'
        fill_in 'Quantidade de quartos', with: 3
        click_on 'Atualizar'

        expect(page).to have_content 'Pousada atualizada com sucesso'
        expect(page).to have_content 'Pousada Aviação'
        expect(page).to have_content 'Av. Pres. Kennedy, 3404'
        expect(page).to have_content 'Aviação'
        expect(page).to have_content 'Praia Grande'
        expect(page).to have_content 'SP'
        expect(page).to have_content '11702-480'
        expect(page).to have_content '(13) 3512-7239'
        expect(page).to have_content 'contato@aviacao.com.br'
    end

    it 'e mantém os campos obrigatórios' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        guesthouse = Guesthouse.create!(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
                    address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', city: 'Ilha Comprida', 
                    state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', email: 'contato@icarai.com.br',
                    cnpj: '58.985.405/0001-06', quantity_rooms: 4, user: user)

        visit root_path
        login_as(user, scope: :user)
        click_on 'Pousada Icaraí'
        click_on 'Editar'
        fill_in 'Nome Comercial', with: 'Pousada Aviação'
        fill_in 'Razão Social', with: 'Pousada Aviação LTDA'
        fill_in 'Endereço', with: 'Av. Pres. Kennedy, 3404'
        fill_in 'Bairro', with: 'Aviação'
        fill_in 'Cidade', with: 'Praia Grande'
        fill_in 'Estado', with: 'SP'
        fill_in 'CEP', with: '11702-480'
        fill_in 'Telefone', with: '(13) 3512-7239'
        fill_in 'E-mail', with: 'contato@aviacao.com.br'
        fill_in 'CNPJ', with: '60.708.274/0001-61'
        fill_in 'Quantidade de quartos', with: 3
        click_on 'Atualizar'
        
    end
end