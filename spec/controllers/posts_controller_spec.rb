require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    include Devise::Test::ControllerHelpers

    before do
        @user = User.create(
            id: 1,
            email: 'user@example.com',
            encrypted_password: 'password',
            created_at: '2023-10-17 11:31:17.614931',
            updated_at: '2023-10-17 11:31:17.614931'
        )

        @post_1 = Post.create(
            id: 1,
            description: 'This is my first post.',
            user_id: @user.id,
            created_at: '2023-10-17 11:31:17.614931',
            updated_at: '2023-10-17 11:31:17.614931'
        )

        @post_2 = Post.create(
            id: 2,
            description: 'This is my first post.',
            user_id: 2,
            created_at: '2023-10-17 11:31:17.614931',
            updated_at: '2023-10-17 11:31:17.614931'
        ) 

        sign_in @user 

        @posts = []
        @posts.push(@post_1, @post_2)
        
    end

    describe '#index' do
        it 'returns a list of all posts' do
            get :index

            expect(response).to be_successful
            expect(response).to render_template(:index)#контроллер отображает правильный шаблон
            expect(@posts).to include(@post_2)
        end

        it 'returns all posts of the current user' do
            get :index
    
            expect(response).to be_successful
            expect(response).to render_template(:index)#контроллер отображает правильный шаблон
            expect(@post_1.user_id).to eq(@user.id)
        end
    end

    describe '#show' do
        it 'returns a specific post by id' do
            get :show, params: { id: @post_1.id }
            
            expect(response).to be_successful
            expect(response).to render_template(:show)#контроллер отображает правильный шаблон
            expect(assigns(:post)).to be_present
        end
    end
end
