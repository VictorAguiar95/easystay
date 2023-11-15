require 'rails_helper'

describe 'Proprietário tenta cadastra uma pousada' do

    it 'sem ter efetuado o login' do
    
        visit root_path
        within('nav') do
            click_on 'Anuncie Conosco'
        end

        expect(current_path).to eq new_user_session_path
    end

    it 'a partir da tela inicial' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        guesthouse = Guesthouse.create!(trade_name: 'Pousada Icaraí', corporate_name: 'Pousada Icaraí LTDA', 
                    address: 'Av. Beira Mar, 11380', neighborhood: 'Balneário Icaraí', city: 'Ilha Comprida', 
                    state: 'SP', cep: '11925-000', phone_number: '(13) 3842 1110', email: 'contato@icarai.com.br',
                    cnpj: '58.985.405/0001-06', quantity_rooms: 4, user: user)

        visit root_path
        login_as(user, scope: :user)
        within('nav') do
            click_on 'Anuncie Conosco'
        end

        expect(page).to have_field('Nome Comercial')
        expect(page).to have_field('Razão Social')
        expect(page).to have_field('Endereço')
        expect(page).to have_field('Bairro')
        expect(page).to have_field('Cidade')
        expect(page).to have_field('Estado')
        expect(page).to have_field('CEP')
        expect(page).to have_field('Telefone')
        expect(page).to have_field('E-mail')
        expect(page).to have_field('CNPJ')
        expect(page).to have_field('Quantidade de quartos')
        #expect(page).to have_field('Aceita animais de estimação?')
    end

    it 'com sucesso' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        
        visit root_path
        login_as(user, scope: :user)
        click_on 'Anuncie Conosco'
        fill_in 'Nome Comercial', with: 'Pousada Icaraí'
        fill_in 'Razão Social', with: 'Pousada Icaraí LTDA'
        fill_in 'Endereço', with: 'Av. Beira Mar, 11380'
        fill_in 'Bairro', with: 'Balneário Icaraí'
        fill_in 'Cidade', with: 'Ilha Comprida'
        fill_in 'Estado', with: 'SP'
        fill_in 'CEP', with: '11925-000'
        fill_in 'Telefone', with: '(13) 3842 1110'
        fill_in 'E-mail', with: 'contato@icarai.com.br'
        fill_in 'CNPJ', with: '58.985.405/0001-06'
        fill_in 'Quantidade de quartos', with: 4
        check 'Permite Pets?'
        fill_in 'Descrição', with: 'Descrição da Pousada Icaraí'
        select 'Dinheiro', from: 'Meios de Pagamento'
        fill_in 'Políticas de Uso', with: 'Políticas e regras da pousada'
        fill_in 'Check-in', with: '2023-12-15'
        fill_in 'Check-out', with: '2023-12-20'
        click_on 'Cadastrar Quartos'

        expect(current_path).to eq new_room_path
        expect(page).to have_content '1° Quarto:'
    end

    it 'com dados incompletos' do
        user = User.create!(name: 'Vitor', email: 'vitor@gmail.com', password: '159753vitor')
        
        login_as(user)
        visit root_path
        click_on 'Anuncie Conosco'
        fill_in 'Nome Comercial', with: ''
        fill_in 'Razão Social', with: ''
        fill_in 'Endereço', with: ''
        fill_in 'Bairro', with: ''
        fill_in 'Cidade', with: ''
        fill_in 'Estado', with: ''
        fill_in 'CEP', with: ''
        fill_in 'Telefone', with: ''
        fill_in 'E-mail', with: ''
        fill_in 'CNPJ', with: ''
        click_on 'Cadastrar Quartos'

        expect(page).to have_content 'Dados incompleto, pousada não cadastrada'
        expect(page).to have_content 'Nome Comercial não pode ficar em branco'
        expect(page).to have_content 'Razão Social não pode ficar em branco'
        expect(page).to have_content 'Endereço não pode ficar em branco'
        expect(page).to have_content 'Bairro não pode ficar em branco'
        expect(page).to have_content 'Cidade não pode ficar em branco'
        expect(page).to have_content 'Estado não pode ficar em branco'
        expect(page).to have_content 'CEP não pode ficar em branco'
        expect(page).to have_content 'Telefone não pode ficar em branco'
        expect(page).to have_content 'E-mail não pode ficar em branco'
        expect(page).to have_content 'CNPJ não pode ficar em branco'
        expect(page).to have_content 'Quantidade de quartos não pode ficar em branco'
        expect(page).to have_content 'Estado não possui o tamanho esperado (2 caracteres)'
    end

end
