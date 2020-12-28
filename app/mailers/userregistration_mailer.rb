class UserRegistrationMailer < ApplicationMailer

  def new_registration(user)
    @user = user
    mail to: user.email, subject: '【登録完了】新規登録が完了しました'
  end

end
