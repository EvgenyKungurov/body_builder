class QueueController < BodyBuilder::Controller
  def index
    render :index, count: Users.all
    #File.read('/home/evgeny/ruby/body_builder-master/examples/public/count.txt')
  end

  def registration
    render :registration
  end

  def add_to_queue
    count = File.read('/home/evgeny/ruby/body_builder-master/examples/public/count.txt').to_i
    File.open('/home/evgeny/ruby/body_builder-master/examples/public/count.txt', 'w') do |file|
      file.puts count + 1
    end
    redirect_to :registration
  end
end
