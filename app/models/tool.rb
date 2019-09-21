class Tool
  def self.pipe(ini, *funs)
    ini = ini
    funs.each do |fun|
      ini = fun.call(ini)
    end

    ini
  end
end
