require 'rails_helper'

describe 'Proprietário cadastra um quarto' do
    it 'a partir da tela inicial' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        
        login_as(user, scope: :user)        
        visit root_path
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
        select 'Sim', from: 'Aceita animais de estimação?'
        click_on 'Cadastrar Quartos'

        expect(page).to have_content('Quarto')
        expect(page).to have_field('Nome')
        expect(page).to have_field('Descrição')
        expect(page).to have_field('Tamanho')
        expect(page).to have_field('Quantas pessoas?')
        expect(page).to have_select('Banheiro', with_options: ['Interno', 'Externo'])
        expect(page).to have_select('Varanda', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Wi-Fi', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Ar Condicionado', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Televisão', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Guarda-roupas', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Cofre', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Acessibilidade para deficientes', with_options: ['Sim', 'Não'])
        expect(page).to have_select('Disponível?', with_options: ['Sim', 'Não'])
        expect(page).to have_button('Atualizar')
        
    end

    it 'com sucesso' do
        user = User.create!(email: 'proprietario@example.com', password: 'senha123', role: 'proprietario')
        
        login_as(user, scope: :user)        
        visit root_path
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
        select 'Sim', from: 'Aceita animais de estimação?'
        click_on 'Cadastrar Quartos'
        fill_in 'Nome', with: 'Quarto Deluxe'
        fill_in 'Descrição', with: 'Quarto espaçoso com vista para o mar'
        fill_in 'Tamanho', with: '30'
        fill_in 'Quantas pessoas?', with: '2'
        select 'Interno', from: 'Banheiro'
        select 'Sim', from: 'Varanda'
        select 'Sim', from: 'Wi-Fi'
        select 'Sim', from: 'Ar Condicionado'
        select 'Sim', from: 'Televisão'
        select 'Sim', from: 'Guarda-roupas'
        select 'Sim', from: 'Cofre'
        select 'Sim', from: 'Acessibilidade para deficientes'
        select 'Sim', from: 'Disponível?'
        click_on 'Atualizar'
    
        expect(page).to have_content('Novo quarto cadastrado a pousada!')
    end
end