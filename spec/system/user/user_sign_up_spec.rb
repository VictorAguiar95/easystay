require 'rails_helper'

describe 'Usuário se cadastra' do
    it 'com sucesso' do

        visit root_path
        click_on 'Cadastrar-se'
        fill_in 'Nome', with: 'Vitor'
        fill_in 'E-mail', with: 'vitor@gmail.com'
        fill_in 'Senha', with: '159753vitor'
        fill_in 'Confirme sua senha', with: '159753vitor'
        click_on 'Sign up'

        expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
        expect(page).to have_content 'vitor@gmail.com'
        expect(page).to have_content 'Sair'
        user = User.last
        expect(user.name).to eq 'Vitor'
    end
end