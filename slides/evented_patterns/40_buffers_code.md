!SLIDE full-page code

    @@@ruby
    class MyConnection
      def receive_data(inbound)
        # inbound.size can be a single protocol
        # message or a batch - stream of data
      end

      def send_data(outbound)
        # enqueued on a write queue
      end
    end
