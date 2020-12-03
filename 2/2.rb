
class Record
  def initialize(line)
    @line = line
  end

  def password
    rule_components.last
  end

  def rules_letter
    rules.chars.last
  end

  def first_position
    Integer(record_components.first)
  end

  def second_position
    Integer(record_components.last)
  end

  private

  attr_reader :line

  def rules
    rule_components.first
  end

  def range
    rules.split(' ').first
  end

  def record_components
    range.split('-')
  end

  def rule_components
    line.split(': ')
  end
end

class Validator
  def check(letter, first_position, second_position, password)
    (password[first_position - 1] == letter) ^ (password[second_position - 1] == letter)
  end
end

pp File
  .read('input')
  .split("\n")
  .map { |s| Record.new(s) }
  .count { |l| Validator.new.check(l.rules_letter, l.first_position, l.second_position, l.password) }
