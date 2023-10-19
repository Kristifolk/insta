require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    before do
        @comments = []
      end

    describe '#index' do
        it 'returns a list of comments for the specified post' do
            post = Post.create(
                id: 1,
                description: 'This is my first post.',
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )

            comment_1 = Comment.create(
                id: 1,
                message: 'This is my comment_1.',
                user_id: 1,
                post_id: 1,
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )

            comment_2 = Comment.create(
                id: 2,
                message: 'This is my comment_2.',
                user_id: 1,
                post_id: 1,
                created_at: '2023-10-17 11:31:17.614931',
                updated_at: '2023-10-17 11:31:17.614931'
            )

            @comments.push(comment_1, comment_2)

        get :index, params: { post_id: post.id }

        expect(response).to be_successful
        expect(@comments).to include(comment_1)
        expect(@comments).to include(comment_2)
        end
    end
end
