!SLIDE full-page code

    @@@ruby
    class EventableDescriptor
      def read; end             # Tell don't ask
      def write; end            # interface
      def heartbeat; end
      def select_for_read; end  # IO multiplexer
      def select_for_write; end # agnostic
    end