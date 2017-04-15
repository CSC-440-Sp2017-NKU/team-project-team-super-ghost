module PostsHelper
  
  attr_accessor :post_votes, :upvote_count, :downvote_count
  
  
  def get_upvote_percent(post)
    # Get the number of likes and dislikes for a post.
    likes = @post.post_votes.upvote_count
    dislikes = @post.post_votes.downvote_count
    
    # Convert values to floats and then get the total count of both variables.
    likes = likes.to_f
    dislikes = dislikes.to_f
    total = likes + dislikes
    
    # Generate and return the percentage.
    return (likes / total) * 100.0
  end
  
  def get_downvote_percent(post)
    # Get the number of likes and dislikes for a post.
    likes = @post.post_votes.upvote_count
    dislikes = @post.post_votes.downvote_count
    
    # Convert values to floats and then get the total count of both variables.
    likes = likes.to_f
    dislikes = dislikes.to_f
    total = likes + dislikes
    
    # Generate and return the percentage.
    return (dislikes / total) * 100.0
  end
  
end
