class MessagesController < ApplicationController
  load_and_authorize_resource
  before_action :find_candidate, only: %i[new create]
  before_action :set_message, only: %i[show]

  def index
    @messages = current_user.messages.order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @message = Message.new(session[:message_us_params])
  end

  def create
    recaptcha_passed = verify_recaptcha(model: @message)
    @message = @user.messages.build(message_params)
    if recaptcha_passed && @message.save
      session.delete(:message_us_params)
      flash[:success] = t('flash.messages.success', user_name: @user.first_name)
    else
      session[:message_us_params] = message_params
      flash[:error] = t('flash.messages.recaptcha') unless recaptcha_passed
      flash[:error] = @message.errors.full_messages.join(', ') if recaptcha_passed
    end
    redirect_to cv_section_path(@user.subdomain)
  end

  def show
    @message.status_open if @message.status == 'new'
  end

  def update
    message = Message.find_by(id: params[:id])
    message.update(message_params)
    redirect_back(fallback_location: messages_path, notice: t('.success', scope: :flash))
  end

  private

  def find_candidate
    @user = User.find_by(id: message_params[:user_id])
  end

  def message_params
    params.require(:message).permit!
  end

  def set_message
    @message = current_user.messages.find(params[:id])
  end
end
