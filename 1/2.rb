puts File
  .read('input')
  .split
  .map(&:to_i)
  .permutation(3)
  .detect { |e| e.sum == 2020 }
  .inject(&:*)
