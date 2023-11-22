require 'rails_helper'

describe 'Usuário se autentica' do
    it 'com sucesso' do

        User.create! email: 'vitor@gmail.com', password: '159753vitu'

        visit root_path
        click_on 'Entrar'
        within('form') do
            fill_in 'E-mail', with: 'vitor@gmail.com'
            fill_in 'Senha', with: '159753vitu'
            click_on 'Log in'
        end

        expect(page).to have_content 'Login efetuado com sucesso.'
        within('nav') do
            expect(page).not_to have_link 'Entrar'
            expect(page).to have_button 'Sair'
            expect(page).to have_content 'vitor@gmail.com'
        end
    end

    it 'e faz logout' do

        User.create! email: 'vitor@gmail.com', password: '159753vitu'

        visit root_path
        click_on 'Entrar'
        within('form') do
            fill_in 'E-mail', with: 'vitor@gmail.com'
            fill_in 'Senha', with: '159753vitu'
            click_on 'Log in'
        end
        click_on 'Sair'

        expect(page).to have_content 'Logout efetuado com sucesso.'
        expect(page).not_to have_link 'Sair'
        expect(page).to have_link 'Entrar'
        expect(page).not_to have_content 'vitor@gmail.com'
    end
    
    it 'como proprietario' do
    end
    
    it 'como cliente' do
    end
end
