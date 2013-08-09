class Employee
  attr_reader :name
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

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer observer
    @observers << observer
  end

  def delete_observer observer
    @observers.delete observer
  end
end

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
