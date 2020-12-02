puts File
  .read('input')
  .split
  .map(&:to_i)
  .permutation(2)
  .detect { |e| e.sum == 2020 }
  .inject(&:*)
