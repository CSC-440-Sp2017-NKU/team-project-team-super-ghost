class CommentVote < ActiveRecord::Base
  validates_uniqueness_of :comment_id, :scope => :user_id

  belongs_to :comment
  belongs_to :user

  scope :upvote_count, -> { where(is_upvote: true).count }
  scope :downvote_count, -> { where(is_upvote: false).count }
  scope :score, -> { upvote_count - downvote_count }

  def self.vote(comment_id)
    where(comment_id: comment_id).first
  end
end
