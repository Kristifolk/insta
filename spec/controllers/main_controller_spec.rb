require 'rails_helper'

RSpec.describe MainController, type: :controller do
    before do
        @posts = []
        @friends = []
      end

    describe '#index' do
        it 'returns a list of all posts' do
            post_1 = Post.create(
                id: 1,
                description: 'This is my first post.',
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )
            post_2 = Post.create(
                id: 2,
                description: 'This is my second post.',
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )

            @posts.push(post_1, post_2)
            #pp(@posts)

            get :index

            expect(response).to be_successful
            expect(@posts).to include(post_1)
            expect(@posts).to include(post_2)
        end
   
        it 'returns a list of all friends' do
            friend_1 = Friend.create(
                id: 1,
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )
            friend_2 = Friend.create(
                id: 2,
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )

            @friends.push(friend_1, friend_2)
            #pp(@friendas)

            get :index

            expect(response).to be_successful
            expect(@friends).to include(friend_1)
            expect(@friends).to include(friend_2)
        end
    end
end
