!SLIDE full-page code

    @@@ruby
    class MyConnection
      def receive_data(data) # no need to
        @queue << data       # wire transport
      end
    end

    def test_enqueue_on_receive
      conn.receive_data "stub data"
      assert_equal 1, conn.queue.size
    end