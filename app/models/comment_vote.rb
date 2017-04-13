class CommentVote < ActiveRecord::Base
  validates_uniqueness_of :comment_id, :scope => :user_id

  belongs_to :comment
  belongs_to :user

  scope :upvote_count, -> { where(is_upvote: true).count }
  scope :downvote_count, -> { where(is_upvote: false).count }
  scope :score, -> { upvote_count - downvote_count }
  scope :vote, -> { where(comment_id: comment.id).first }
end
