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

  def min
    Integer(record_components.first)
  end

  def max
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
  def check(letter, min, max, counts)
    counts[letter] && counts[letter] >= min && counts[letter] <= max
  end
end

pp File
  .read('input')
  .split("\n")
  .map { |s| Record.new(s) }
  .count { |l| Validator.new.check(l.rules_letter, l.min, l.max, l.password.chars.tally) }

# Note: `tally` was added in Ruby 2.7: https://medium.com/@baweaver/ruby-2-7-enumerable-tally-a706a5fb11ea
