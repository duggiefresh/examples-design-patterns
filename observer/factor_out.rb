# we will inherit from the Subject class
class Subject
  attr_reader :observers

  def initialize
    @observers = []
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer *observers
    observers.each do |observer|
      @observers << observer
    end
  end

  def delete_observer observer
    @observers.delete observer
  end
end

# class Employee is the 'subject' class
class Employee < Subject
  attr_reader :name
  attr_accessor :title, :salary

  def initialize name, title, salary
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

# classes Payroll and TaxMan are 'observer' classes
class Payroll
  def update changed_employee
    puts "Cut a new check for #{changed_employee.name}!"
    puts "The new salary is #{changed_employee.salary}!"
  end
end

class TaxMan
  def update changed_employee
    puts "Send #{changed_employee.name} a new tax bill!"
  end
end
