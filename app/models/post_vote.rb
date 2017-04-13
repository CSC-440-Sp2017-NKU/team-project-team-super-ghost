class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  scope :upvote_count, -> { where(is_upvote: true).count }
  scope :downvote_count, -> { where(is_upvote: false).count }
  scope :score, -> { upvote_count - downvote_count }

  def self.vote(post_id)
    where(post_id: post_id).first
  end
end
