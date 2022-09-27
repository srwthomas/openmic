# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  def new_post_email
    # Set up a temporary post for the preview
    post = Post.new(created_at:"28/09/2022", name: "Joe Smith & the boys", instrument: "Guitar", genre: "Blues")

    PostMailer.with(post: post).new_post_email
  end
end
