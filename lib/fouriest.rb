module Fouriest
  def in_base(base)
    d, r = self.divmod base
    return [r] if d == 0
    d.in_base(base) + [r]
  end

  def four_count(base)
    self.in_base(base).count(4)
  end

  def fourier_transforms(relative_base=10)
    baseline = self.four_count(relative_base)
    pairs = (5..self).map do |base|
      [base, self.four_count(base)]
    end
    Hash[pairs.reject { |_, four_count| four_count <= baseline }]
  end

  def fouriest_transforms(relative_base=10)
    grouped = fourier_transforms(relative_base).group_by {|base, four_count| four_count}
    return [] if grouped.empty?
    max_four_count = grouped.max_by {|four_count, transforms| four_count}[0]
    Hash[max_four_count, grouped[max_four_count].map {|base, four_count| base}]
  end

  def fouriest_didactic(relative_base=10, wrap=80)
    sb = if relative_base == 10
           "#{self} has a four-count of #{four_count(10)}.\n"
         else
           "#{self}, in base #{relative_base}, is #{in_base(relative_base).inspect}. It has a four-count of #{four_count(relative_base)}.\n"
         end
    ft = fourier_transforms(relative_base)
    if ft.empty?
      sb += "There are no bases in which #{self} has a higher four-count than this! Therefore, #{self} (in base #{relative_base}, anyway) has no fourier transforms, and thereby no fouriest transforms."
    else
      fts = ft.map do |base, four_count|
        "#{base}, in which it is #{in_base(base).inspect}, with a four-count of #{four_count}."
      end
      if ft.length == 1
        sb += "The only base in which #{self} has a higher four-count is #{fts[0]}Obviously, that means that #{fts[0][0]} is also the base of its fouriest transform!"
      else
        sb += "\nThe bases in which #{self} has a higher four-count are:\n#{fts.join "\n"}\n\nObviously, the highest four-count among these is #{fouriest_transforms(relative_base).keys[0]}. The bases which yield this four-count are #{fouriest_transforms(relative_base).values[0].inspect}. These are the bases of its fouriest transform!"
      end
    end
    sb.gsub(/(.{1,#{wrap}})( +|$\n?)|(.{1,#{wrap}})/, "\\1\\3\n")
  end
end
