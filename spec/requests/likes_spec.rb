require 'rails_helper'

RSpec.describe LikesController, type: :request do
  let(:user) { create(:user) }
  let(:tweet) { create(:post, user_id: user.id, content: "content") }
  let(:like) { create(:like, user_id: user.id, post_id: tweet.id) }
  
  describe "POST #create" do
    before do
      sign_in user
    end
    
    it "add_like" do
      expect do
         post like_path(tweet.id), params: {post_id: tweet.id, user_id: user.id} 
       end.to change{Like.count}.by(1)
    end
  end
  
  describe "DELETE #destroy" do
    before do
      sign_in user
    end
    
    it "destroy_like" do
        like = create(:like, user_id: user.id, post_id: tweet.id)
      expect do
        delete unlike_path(tweet.id), params: {post_id: tweet.id, user_id: user.id}
      end.to change{ Like.count}.by(-1)
    end
  end
end