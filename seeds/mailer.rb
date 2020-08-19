user = Model::User::Base.where(email: "mechuri@playthe.world").take
user ||= Model::User::Base.create!(
  email: "mechuri@playthe.world",
  password: "123456",
  password_confirmation: "123456"
)
user.update!(nickname: "mechuri")

Model::UserMailer.with(user: user).welcome.deliver_now
