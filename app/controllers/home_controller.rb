class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # we are ignoring pagination for now
    @records = Email.all.order("id desc")

  end



  def create

    EmailCombination.new(
        params[:first_name],
        params[:last_name],
        params[:url],
    ).generate.each do |email|
      #do not check existing email
      if Email.where(email: email).exists?
        redirect_to '/', notice: "Email already there in DB" and return
      end

      if EmailChecker.new(email).check
        Email.create(
            email: email,
            first_name: params[:first_name],
            last_name: params[:last_name]
        )
        redirect_to '/', notice: "#{email} is valid" and return
      end
    end

    redirect_to '/', notice: "Not able to find valid email"

  end



end
