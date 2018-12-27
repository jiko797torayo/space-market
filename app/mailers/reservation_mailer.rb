class ReservationMailer < ApplicationMailer
  def send_when_create(user, reservation)
    @user = user
    @reservation = reservation
    mail  to: user.email,
          subject: '予約を受け付けました'
  end
end
