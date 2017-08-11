module Mailboxer
  class ConversationSerializer < ActiveModel::Serializer
    include ActionView::Helpers::TextHelper

    attributes  :id,
                :last_date,
                :last_body,
                :last_subject,
                :fullname,
                :avatar,
                :username

    def avatar
      object.originator.avatar.url
    end

    def fullname
      object.originator.fullname
    end

    def last_body
      truncate(object.messages.last.body, length: 145, separator: ' ')
    end

    def last_date
      object.messages.last.created_at
    end

    def last_subject
      object.subject
    end

    def username
      object.originator.username
    end
  end
end
