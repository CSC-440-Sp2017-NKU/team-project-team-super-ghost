module CommentsHelper
  attr_accessor :comment_votes, :upvote_count, :downvote_count
  
  def get_comment_upvote_percent(comment)
    # Get the number of likes and dislikes for a post.
    likes = comment.comment_votes.upvote_count
    dislikes = comment.comment_votes.downvote_count
    
    # Convert values to floats and then get the total count of both variables.
    likes = likes.to_f
    dislikes = dislikes.to_f
    total = likes + dislikes
    
    # Generate and return the percentage.
    return (likes / total) * 100.0
  end
  
  def get_comment_downvote_percent(comment)
    # Get the number of likes and dislikes for a post.
    likes = comment.comment_votes.upvote_count
    dislikes = comment.comment_votes.downvote_count
    
    # Convert values to floats and then get the total count of both variables.
    likes = likes.to_f
    dislikes = dislikes.to_f
    total = likes + dislikes
    
    # Generate and return the percentage.
    return (dislikes / total) * 100.0
  end
end
