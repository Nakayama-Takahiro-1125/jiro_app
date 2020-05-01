require 'rails_helper'


  RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }
  
  describe 'GET #edit' do
    subject { get edit_user_registration_path }
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it 'リクエスト成功' do
        is_expected.to eq 200
      end
    end
    context 'ログインしていない場合' do
      it 'リダイレクトされる' do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
end