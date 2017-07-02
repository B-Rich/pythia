module Pythia
  class Warnings
    attr_reader :messages

    def initialize(params)
      @params = params
      @messages = []

      load_messages
    end

    def list
      @messages.map(&:warning_id)

    end

    private

    def load_messages
      @params.each do |hash|
        @messages << Message.new(hash)
      end
    end

    class Message
      attr_reader :warning_id, :content

      def initialize(params)
        @warning_id = params[:warning_id]
        @content  = params[:message]
      end

      def to_a
        [@warning_id.to_sym, @content]
      end
    end
  end
end
