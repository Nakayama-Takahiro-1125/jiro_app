require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
  #userを生成しておく
  let(:user) { create(:user) }
  #ハッシュとして使えるパラメータuser_paramsを生成しておく
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }
  
  describe 'POST #create' do
    context 'パラメーターが妥当な場合'  do
      it 'リクエストが成功' do
        post user_registration_path, params: {user: user_params }
        expect(response.status).to eq 302
      end
      
      it 'createが成功' do
        expect do
          post user_registration_path, params: {user: user_params}
        end.to change(User, :count).by 1
      end
      
      it 'ユーザー登録後redirect' do
        post user_registration_path, params: {user: user_params}
        expect(response).to redirect_to posts_path
      end
    end
    
    context 'パラメーターが不正な場合' do
      it 'リクエストの成功' do
        post user_registration_path, params: {user: invalid_user_params}
        expect(response.status).to eq 200
      end
      
      it 'createの失敗' do
        expect do
        post user_registration_path, params: {user: invalid_user_params}
        end.to_not change(User, :count)
      end
    end
  end
end