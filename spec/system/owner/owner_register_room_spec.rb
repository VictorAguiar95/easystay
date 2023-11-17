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
        #choose 'pets_allowed_true 'Sim''
        click_on 'Cadastrar Quartos'
        
    end
end

#preciso botar o nome da pousada aqui tbm.