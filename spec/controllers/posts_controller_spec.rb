require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe '#index' do
    it 'returns a list of all posts' do
      user = create(:user)  # Создание пользователя с помощью фабрики FactoryBot
      post_1 = create(:post, user: user)# Создание поста с ассоциацией к пользователю
      post_2 = create(:post)

      sign_in user

      get :index

      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(assigns(:posts)).to include(post_2)
    end

    it 'returns all posts of the current user' do
      user = create(:user)
      post_1 = create(:post, user: user)
      post_2 = create(:post)  # Создание поста другого пользователя

      sign_in user

      get :index

      expect(response).to be_successful
      expect(response).to render_template(:index)#контроллер отображает правильный шаблон
      expect(assigns(:posts)).to include(post_1)
    end
  end

  describe '#show' do
    it 'returns a specific post by id' do
      user = create(:user)
      post = create(:post, user: user)

      sign_in user

      get :show, params: { id: post.id }

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(assigns(:post)).to eq(post)
    end
  end
end
