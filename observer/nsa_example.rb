module Email
  extend self

  def send subject, sender, receiver
    puts %Q[
      Subject: #{subject}
      From:    #{sender}@example.com
      To:      #{receiver}@example.com
      Date:    #{Time.now.asctime}
      ]
  end
end

class Snooper
  def update person
    puts "!!! ALERT NEW EMAIL !!!"
    puts "#{person.name} sent an email"
  end
end

class Person
  include Email
  attr_reader :name, :observers
  def initialize name
    @name = name
    @observers = []
  end

  def create_email subject, receiver
    Email.send subject, name, receiver
    notify_observers
  end

  def add_observer *observers
    observers.each do |observer|
      @observers << observer
    end
  end

  private

  def notify_observers
    observers.each do |observer|
      observer.update self
    end
  end

  def delete_observer observer
    observers.delete observer
  end
end
