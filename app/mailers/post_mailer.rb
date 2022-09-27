class PostMailer < ApplicationMailer
  def new_post_email
    @post = params[:post]

    mail(to: ENV["ADMIN_EMAIL"], subject: "You got a new post!")
  end
end
