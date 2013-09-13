# class Employee is the 'subject' class
class Employee
  attr_reader :name, :observers
  attr_accessor :title, :salary

  def initialize name, title, salary
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def add_observer *observers
    observers.each do |observer|
      observers << observer
    end
  end

  def delete_observer *observers
    observers.each { |observer| @observers.delete observer }
  end

  private

  def notify_observers
    observers.each do |observer|
      observer.update(self)
    end
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
