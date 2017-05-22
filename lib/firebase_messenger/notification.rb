module FirebaseMessenger
  class Notification
    def self.build(recipient, payload)
      recipients = build_recipient(recipient)
      notification_body = payload.delete(:notification)
      FirebaseMessenger::Api::Notification.new(recipients, notification_body, payload)
    end

    def self.build_recipient(recipient)
      array = [] << recipient
      array.flatten.compact
    end
  end
end
