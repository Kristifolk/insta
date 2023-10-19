# require 'rails_helper'
# require 'devise/test/controller_helpers'

# RSpec.describe FriendsController, type: :controller do
#   include Devise::Test::ControllerHelpers

#   before do
#     @friends = []
#   end

#   describe '#friendly' do
#     it 'returns a list of all friends' do
#       friend_1 = Friend.create(
#           id: 1,
#           created_at: '2023-10-17 11:31:17.614931',
#           updated_at: '2023-10-17 11:31:17.614931'
#       )
#       friend_2 = Friend.create(
#           id: 2,
#           created_at: '2023-10-17 11:31:17.614931',
#           updated_at: '2023-10-17 11:31:17.614931'
#       )

#       @friends.push(friend_1, friend_2)
#       pp(@friends)

#       # Внедряем объект request.env['warden']
#       request.env['warden'] = mock_warden(:user => current_user)

#       get :friendly, params: { post_user_id: 1 }

#       expect(response).to be_successful
#       expect(@friends).to include(friend_1)
#       expect(@friends).to include(friend_2)
#     end
#   end
# end

