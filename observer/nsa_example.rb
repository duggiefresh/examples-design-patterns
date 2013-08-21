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

module Subject
  attr_reader :observers

  def initialize
    @observers = []
  end

  def add_observer *observers
    observers.each do |observer|
      @observers << observer
    end
  end

  def delete_observer *observers
    observers.each { |observer| @observers.delete observer }
  end

  private

  def notify_observers
    observers.each do |observer|
      observer.gotcha self
    end
  end
end

class Snooper
  def gotcha person
    puts %[!!! ALERT: #{person.name.upcase} SENT AN EMAILL !!!]
  end
end

class Agent
  def gotcha person
    puts "Time to detain #{person.name}!"
  end
end

class Person
  include Email, Subject
  attr_reader :name, :observers

  def initialize name
    super()
    @name = name
  end

  def create_email subject, receiver
    Email.send subject, name, receiver
    notify_observers
  end
end
