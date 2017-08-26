module MailboxHelper
  def unread_messages_count
    mailbox.inbox(unread: true).distinct.count
  end
end
