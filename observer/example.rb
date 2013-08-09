class Employee
  attr_reader :name
  attr_accessor :title, :salary

  def initialize name, title, salary, payroll
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end

class Payroll
  def update changed_employee
    puts "Cut a new check for #{changed_employee.name}!"
    puts "The new salary is #{changed_employee.salary}!"
  end
end
