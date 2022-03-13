class Message < ActiveRecord::Base
    belongs_to :conversation
    belongs_to :account
    has many :conversations, through: :account

    validates_presence_of :body, :conversation_id, :account_id

    def message_time
        created_at.strftime("%m/%d/%y at %l:%M %p")
    end
end