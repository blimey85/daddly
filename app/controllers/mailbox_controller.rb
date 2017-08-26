class MailboxController < ApplicationController
  before_action :authenticate_user!
  layout false, except: [:index]

  def index
    @messages = mailbox.sentbox.page(params[:page]).per(1)
    console
  end

  def inbox
    @messages = mailbox.inbox.page(params[:page]).per(1)
  end

  def sent
    @messages = mailbox.sentbox.page(params[:page]).per(1)
  end

  def trash
    @messages = mailbox.trash.page(params[:page]).per(1)
  end
end
